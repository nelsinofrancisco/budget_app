module NavModule
  def new_group_nav_options
    @back_option = true
    @path = root_path
    @title = 'Add a category'
    @search = false
    @transaction = false
  end

  def index_group_navbar_options
    @title = 'Categories'
    @path = root_path
    @links = {
      categories: {
        name: 'Categories',
        path: new_user_session_path
      },
      logout: {
        name: 'Log out',
        path: destroy_user_session_path
      }
    }
  end

  def show_group_nav_options
    @back_option = true
    @path = root_path
    @title = 'Transactions'
    @search = true
    @transaction = true
  end

  def new_transaction_nav_options
    @back_option = true
    @path = group_path(params[:group_id])
    @title = 'New Transaction'
  end
end
