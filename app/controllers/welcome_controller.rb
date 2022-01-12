class WelcomeController < ApplicationController
  def index
    render_nav(true)
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
    @welcome = boolean if boolean
  end
end
