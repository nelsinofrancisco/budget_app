class UserTransactionsController < ApplicationController
  def new
    render_nav(true)
    respond_to do |format|
      format.js { render 'user_transactions/js/new.js.erb' }
      format.html
    end
  end

  def create; end
end
