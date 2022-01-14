class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    render_nav(true)
    @groups = @user.groups
    respond_to do |format|
      format.js { render 'groups/js/index.js.erb' }
      format.html
    end
  end

  def show
    render_nav(true)
    @group = Group.find_by_id(params[:id])
    @user_transactions = @group.user_transactions
    respond_to do |format|
      format.js { render 'groups/js/show.js.erb' }
      format.html
    end
  end

  def new
    render_nav(true)
    @groups = @user.groups
    respond_to do |format|
      format.js { render 'groups/js/new.js.erb' }
    end
  end

  def create
    @group = Group.new(group_params)

    redirect_to groups_path, format: 'js' if @group.save
  end

  protected

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
