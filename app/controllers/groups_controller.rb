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
    @group = Group.where(params[:id])
    @user_transactions = @group.transactions_groups.includes(:user_transaction).order(created_at: :desc)
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

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
