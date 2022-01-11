class ApplicationController < ActionController::Base
  before_action :logged_user

  protected

  def logged_user
    @user = current_user
  end
end
