class Like < ApplicationRecord
  belongs_to :user
  belongs_to :message
  validates :user_id, presence: true, uniqueness: { scope: :message_id }
  validates :message_id, presence: true
end
