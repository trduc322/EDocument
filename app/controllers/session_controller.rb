class SessionController < ApplicationController
  def new
  end



  def create
    @user = User.find_by email: params[:session][:email].downcase
    @admin = Admin.find_by admail: params[:session][:email].downcase
    if @user.present?
      if @user.authenticate(params[:session][:password])
      login_user @user
      flash[:success]= "Login successs"
      redirect_to @user
      else
      flash.now[:danger] = "email or password incorrect"
      render :new
      end
    else
      if @admin.present?&&@admin.authenticate(params[:session][:password])
      login_admin @admin
      flash[:success]= "Login successs"
      redirect_to @admin
      else
      flash.now[:danger] = "email or password incorrect"
      render :new
      end
    end
  end



  def destroy
    session.delete(:user_id)
    session.delete(:admin_id)
    @current_user = nil
    @current_admin = nil
    flash[:success]= "Goodbye"
      redirect_to root_path
  end

  # def destroyad
  #   session.delete(:admin_id)
  #   @current_admin = nil
  #   flash[:success]= "Goodbye"
  #     redirect_to root_path
  # end
end
