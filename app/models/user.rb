class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}
    validates :password, presence: true, length: {minimum: 6}


    has_many :microposts, dependent: :destroy
    has_many :active_relationships, class_name: "Relationship",
             foreign_key: "follower_id",
             dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship",
             foreign_key: "followed_id",
             dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
    attr_accessor :remember_token, :activation_token
    before_create :generate_activation_token
    before_save :downcase_email
    #1. The ability to save a securely hashed password_digest attribute to the database
    #2. A pair of virtual attributes (password and password_confirmation), including presence validations upon object creation and a validation requiring that they match
    #3. An authenticate method that returns the user when the password is correct (and false otherwise)
    has_secure_password
    # has_secure_password automatically adds an authenticate method to the corresponding model objects.
    # This method determines if a given password is valid for a particular user by computing its digest and comparing the result to password_digest in the database.

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
            BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def user_remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def user_forget
        update_attribute(:remember_digest, nil)
    end

    # Returns true if the given token matches the digest.
    def user_authenticated?(attribute, token)
        digest = self.send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end






    #实现动态流原型
    def feed

     Micropost.all
    end

    #关注另一个用户
    def follow(other_user)
        following << other_user
    end

    #取消关注另一个用户
    def unfollow(other_user)
        following.delete(other_user)
    end

    #如果当前用户关注了指定的用户，返回true
    def following?(other_user)
        following.include?(other_user)
    end
    private

    def generate_activation_token
        self.activation_token = User.new_token
        self.activation_digest = User.digest(self.activation_token)
    end

    def downcase_email
        self.email = self.email.downcase
    end

end
