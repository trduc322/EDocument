module ApplicationHelper

    def login_user user
        session[:user_id] = user.id
    end

    

    

    def login?
        return if current_user
            flash[:danger]=" You need login"
            redirect_to log_in_path
     end


     
    def login_admin admin
        session[:admin_id] = admin.id
    end

    def current_user
        @current_user ||= User.find_by id: session[:user_id]

    end

    def current_admin
        @current_admin ||= Admin.find_by id: session[:admin_id]

    end

    def adlogin?
        return if current_admin
            flash[:danger]=" You need login"
            redirect_to log_in_path
     end

end
