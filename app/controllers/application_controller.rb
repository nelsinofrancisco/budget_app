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
    @search = true
    @links = {
      login: {
        name: 'Log in',
        path: new_user_session_path
      },
      sign_up: {
        name: 'Sign up',
        path: new_user_registration_path
      }
    }
  end
end
