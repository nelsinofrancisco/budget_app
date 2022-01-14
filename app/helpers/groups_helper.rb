module GroupsHelper
  def transactions_total
    transaction_total = 0
    @user_transactions.each do |transaction|
      transaction_total += transaction.amount
    end
    transaction_total
  end
end
