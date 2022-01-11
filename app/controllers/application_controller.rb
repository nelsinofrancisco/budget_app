class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :logged_user

  protected

  def logged_user
    @user = current_user
  end
end
