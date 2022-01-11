class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_transactions do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
