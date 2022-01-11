class CreateTransactionGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user_transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
