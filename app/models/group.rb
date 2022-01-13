class Group < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user
  has_many :transaction_groups, dependent: :destroy
end
