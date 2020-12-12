class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 140 }

  def feed
    Comment.where("micropost_id = :micropost_id", micropost_id: id)
  end
end
