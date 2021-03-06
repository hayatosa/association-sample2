class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_messages, through: :likes, source: :message
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
