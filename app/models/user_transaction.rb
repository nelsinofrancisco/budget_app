class UserTransaction < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :transaction_groups
  has_many :groups, through: :transaction_groups, dependent: :destroy
  validates :amount, numericality: { greater_than: 0 }, presence: true
  validates :name, presence: true
end
