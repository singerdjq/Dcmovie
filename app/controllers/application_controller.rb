class ApplicationController < ActionController::Base
    before_action :authorize
    include SessionsHelper
    protected
    
    def authorize
        unless User.find_by(id: session[:user_id])
            redirect_to login_url, notice: "please log in"
        end
    end
end