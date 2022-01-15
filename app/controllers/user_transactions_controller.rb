class UserTransactionsController < ApplicationController
  def new
    render_nav(true)
    respond_to do |format|
      format.js { render 'user_transactions/js/new.js.erb' }
      format.html
    end
  end

  def create
    @user_transaction = UserTransaction.new(transaction_params)

    if @user_transaction.save
      transaction_group = TransactionGroup.create(transaction_group_params.merge(user_transaction_id: @user_transaction.id))
      redirect_to group_path(transaction_group.group_id), format: 'js' 
    end
  end

  protected

  def transaction_params
    params.require(:user_transaction).permit(:name, :amount, :author_id)
  end

  def transaction_group_params
    params.require(:user_transaction).permit(:group_id)
  end
end
