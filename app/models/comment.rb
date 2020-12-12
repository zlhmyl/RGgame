class Comment < ApplicationRecord
  belongs_to :micropost
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
