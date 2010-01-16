class WelcomeController < ApplicationController
  skip_filter :login_required
  
  def index
    if logged_in?
      redirect_to home_path
    end
  end
end
