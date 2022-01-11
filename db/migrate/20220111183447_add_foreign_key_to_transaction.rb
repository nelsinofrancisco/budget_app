class AddForeignKeyToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_transactions, :author, null: false, foreign_key: { to_table: :users}
  end
end
