class Users::PasswordsController < Devise::PasswordsController
  before_action :navbar_options
  # GET /resource/password/new

  # POST /resource/password

  # GET /resource/password/edit?reset_password_token=abcdef

  # PUT /resource/password

  # The path used after sending reset password instructions

  private

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
