module NavModule
  def new_group_nav_options
    @back_option = true
    @path = root_path
    @title = 'Add a category'
    @search = false
    @transaction = false
    @confirm = true
    @confirm_title = 'Save'
    @confirm_path = new_group_path
  end

  def index_group_navbar_options
    @title = 'Categories'
    @path = root_path
    @links = {
      categories: {
        name: 'Categories',
        path: groups_path
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
    @path = if params[:group_id]
              group_path(params[:group_id])
            else
              groups_path
            end
    @title = 'New Transaction'
    @confirm = true
    @confirm_title = 'Save'
    @confirm_path = new_user_transaction_path
  end
end
