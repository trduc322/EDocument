class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by id: params[:id]
    @e_docs = @user.e_docs.paginate page: params[:page]
    @e_doc = @user.e_docs.new

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new user_params
    @user.coin = 0
    @user.DLerr = 0
        if @user.save
            flash[:success]="create account success!"
            redirect_to root_path
        else
            flash.now[:danger]="create account fail!!!"
            render :new
        end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def userfeed 
    if login?
    @e_doc = current_user.e_docs.build
    @feed_items = current_user.userfeed.paginate page: params[:page]
    end
  end

  



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def Coin
      @user = current_user
      @user.coin -= 10
      @user.save
    end

end
