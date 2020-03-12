class Message < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # message.liked_users で message を「いいね!」しているユーザー一覧が取得できるようになる
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true, length: { maximum: 140 }
end
