class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
