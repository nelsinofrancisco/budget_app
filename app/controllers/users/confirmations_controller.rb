class Users::ConfirmationsController < Devise::ConfirmationsController
  before_action :navbar_options
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
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
