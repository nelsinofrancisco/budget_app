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
    navbar_options
  end


  def show_group_nav_options
    @back_option = true
    @path = root_path
    @title = 'Transactions'
    @search = true
    @transaction = true
  end
end