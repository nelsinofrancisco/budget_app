class Group < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user
  has_many :transaction_groups
  has_many :user_transactions, through: :transaction_groups, dependent: :destroy
end
