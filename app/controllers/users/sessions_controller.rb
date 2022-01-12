class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :navbar_options
  # GET /resource/sign_in

  # POST /resource/sign_in

  # DELETE /resource/sign_out

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def navbar_options
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
