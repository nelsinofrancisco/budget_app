class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.js { render 'welcome/js/index.js.erb' }
      format.html
    end
  end
end
