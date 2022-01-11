class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :transactions, foreign_key: :author_id, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
end
