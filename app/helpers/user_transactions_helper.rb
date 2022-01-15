module UserTransactionsHelper
  def group_list
    {
      groups: @user.groups,
      selected: params[:group_id]
    }
  end
end
