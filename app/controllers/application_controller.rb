class ApplicationController < ActionController::Base
    include StacticPagesHelper
    include ApplicationHelper


    private
    def logged_in_user
        unless logged_in? || adlogged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to log_in_path
        end

    end

    def edoc_exist
        unless edoc? 
            store_location

        end

    end

end
