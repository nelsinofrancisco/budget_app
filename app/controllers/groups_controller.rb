class GroupsController < ApplicationController
  load_and_authorize_resource :user

  def index
    render_nav(true)
    @groups = Group.where(user_id: @user.id).includes(:user_transactions, transaction_groups: [:user_transaction])
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
    @group = Group.new
    respond_to do |format|
      format.js { render 'groups/js/new.js.erb' }
      format.html
    end
  end

  def create
    @group = Group.new(group_params)
    render_nav(true)
    if @group.save
      redirect_to groups_path, format: 'js'
      nil
    else
      respond_to do |format|
        format.html
      end
    end
  end

  protected

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
