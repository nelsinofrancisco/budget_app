class User < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :transactions, foreign_key: :author_id, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  def most_recent_groups
    groups.order(created_at: :desc).limit(5)
  end
end
