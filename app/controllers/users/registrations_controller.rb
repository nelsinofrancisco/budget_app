class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: %i[create new]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    render_nav(true)
    navbar_options
    super
  end

  # POST /resource

  # GET /resource/edit
  def edit
    @logged_user = current_user
    super
  end

  # PUT /resource

  # DELETE /resource

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[name email password password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password password_confirmation])
  end

  def navbar_options
    @session = true
    @back_option = true
    @path = root_path
    @search = false
    @confirm = true
    @confirm_title = 'Next'
    @confirm_path = new_user_registration_path
    @title = 'REGISTER'
  end

  def render_nav(boolean)
    @regular_nav = true if boolean
  end
  # The path used after sign up.

  # The path used after sign up for inactive accounts.
end
