class ApplicationController < ActionController::Base
  before_action :logged_user

  def navbar
    navbar_options
    respond_to do |format|
      format.js { render 'navigations/navbar.js.erb' }
    end
  end

  protected

  def logged_user
    @user = current_user
  end

  def render_nav(boolean)
    @regular_nav = true if boolean
  end

  def navbar_options
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
end
