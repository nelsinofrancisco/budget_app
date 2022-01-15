class UserTransactionsController < ApplicationController
  load_and_authorize_resource

  def new
    render_nav(true)
    @user_transaction = UserTransaction.new()
    @transaction_group = TransactionGroup.new()
    respond_to do |format|
      format.js { render 'user_transactions/js/new.js.erb' }
      format.html
    end
  end

  def create
    render_nav(true)
    @user_transaction = UserTransaction.new(transaction_params)
    @transaction_group = TransactionGroup.new(transaction_group_params)
    
    if @user_transaction.save
        @transaction_group.user_transaction_id = @user_transaction.id
        @transaction_group.save
        redirect_to group_path(@transaction_group.group_id), format: 'js'
        return
    else
      respond_to do |format|
        format.js { render 'user_transactions/js/new.js.erb' }
        format.html
      end
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
