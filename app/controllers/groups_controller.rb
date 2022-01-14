class GroupsController < ApplicationController
  before_action :navbar_options
  load_and_authorize_resource

  def index
    render_nav(true)
    @groups = @user.groups
    respond_to do |format|
      format.html
      format.js { render 'groups/new.js.erb' }
    end
  end

  def show
    render_nav(true)
    show_nav_options
    @group = Group.find_by_id(params[:id])
    @user_transactions = @group.user_transactions
    respond_to do |format|
      format.html
      format.js { render 'groups/show.js.erb' }
    end
  end

  def create
    @group = Group.new(group_params)

    if @group.save 
      redirect_to groups_path, format: 'js'
    end
  end

  protected

  def navbar_options
    @title = 'Categories'
    super
  end

  def show_nav_options
    @back_option = true
    @path = root_path
    @title = 'Transactions'
    @search = true
    @transaction = true
  end
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
