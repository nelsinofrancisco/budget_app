class Group < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user
  has_many :transaction_groups, dependent: :destroy

  def most_recent
    self.transaction_groups.where(group_id: self.id).order(created_at: :desc).limit(5)
  end
end
