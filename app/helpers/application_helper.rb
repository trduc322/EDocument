module ApplicationHelper

    def login_user user
        session[:user_id] = user.id
    end

    def login_id 
        @user = User.find_by id: params[:session][:id]
        return @user.id
    end
    
    

    def login?
        return if current_user
            flash[:danger]=" You need login"
            redirect_to log_in_path
     end


     def current_user? user 
        user && user == current_user 
     end
     
    def login_admin admin
        session[:admin_id] = admin.id
    end

    def current_user
        @current_user ||= User.find_by id: session[:user_id]

    end

    def current_edoc 
        @current_edoc ||= EDoc.find_by id: session[:user_id]
    end

    def current_cmt
        @current_cmt ||= Comment.find_by id: session[:comment_id]
    end

    def current_admin
        @current_admin ||= Admin.find_by id: session[:admin_id]

    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end



    def redirect_back_or default 
        redirect_to_session[:forwarding_url] || default 
        session.delete :forwarding_url
    end

    def adlogin?
        return if current_admin
            flash[:danger]=" You need login"
            redirect_to log_in_path
     end

     def adlogged_in?
        current_admin.present?
     end

     def logged_in?
        current_user.present? 
     end

     def edoc?
        current_edoc.present? 
     end
    

      def correct_user?
        @e_doc = current_user.e_docs.find_by(id: params[:id])
        return true if @e_doc
      end
end
