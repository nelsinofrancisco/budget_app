class UsersController < ApplicationController
  def navbar
    render_nav(true)
    super
  end

  protected

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

  def render_nav(boolean)
    @regular_n = boolean if boolean
  end
end
