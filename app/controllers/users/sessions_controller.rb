class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :navbar_options
  # GET /resource/sign_in

  def new
    render_nav(true)
    navbar_options
    super
  end
  # POST /resource/sign_in

  # DELETE /resource/sign_out

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name password_confirmation])
  end

  def navbar_options
    @session = true
    @back_option = true
    @path = root_path
    @search = false
    @confirm_session = true
    @confirm_title = 'Log In'
    @confirm_path = new_user_session_path
    @title = 'LOGIN'
  end

  def render_nav(boolean)
    @regular_nav = true if boolean
  end
end
