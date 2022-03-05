class PostComment < ApplicationRecord
    belongs_to :user
  belongs_to :post_image

  # コメント空欄の場合のバリデーション
  validates :comment, presence: true
end
