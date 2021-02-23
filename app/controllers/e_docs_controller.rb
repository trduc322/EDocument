class EDocsController < ApplicationController
  before_action :set_e_doc, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]


  # GET /e_docs
  # GET /e_docs.json
  def index
    @e_docs = EDoc.search(params[:docname])
  end

  def indexcategory
      @categories = Category.find(:all)
  end

  # GET /e_docs/1
  # GET /e_docs/1.json
  def show
    @e_doc = EDoc.find_by id: params[:id]
    @comments = @e_doc.comments.paginate(page: params[:page])
    @comment = @e_doc.comments.new
  end

  # GET /e_docs/new
  def new
    @e_doc = EDoc.new
    
  end

  # GET /e_docs/1/edit
  def edit
  end

  # POST /e_docs
  # POST /e_docs.json
  def create
    if(History.where(:dload => 0).where(:user_id => current_user.id).where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).count <10)
    @e_doc = current_user.e_docs.build(e_doc_params)
    @e_doc.file.attach e_doc_params[:file]
    if @e_doc.save
    flash[:success] = "e_doc created!"
    current_user.coin = (current_user.coin.to_f + 10).to_s
    current_user.save
    @history = History.new
    @history.user_id = current_user.id
    @history.e_doc_id = @e_doc.id
    @history.dload = false
    @history.save
    redirect_to root_url
    else
    @feed_items = current_user.userfeed.paginate(page: params[:page])
    flash[:danger] = "FAIL"
    render 'stactic_pages/home'
    end
  else
    flash[:danger] = "OUT OF UPLOAD TIMES"
    redirect_to root_url
  end

end

  # PATCH/PUT /e_docs/1
  # PATCH/PUT /e_docs/1.json
  def update
    respond_to do |format|
      if @e_doc.update(e_doc_params)
        format.html { redirect_to @e_doc, notice: 'E doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @e_doc }
      else
        format.html { render :edit }
        format.json { render json: @e_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /e_docs/1
  # DELETE /e_docs/1.json
  def destroy
    if current_admin
      if @e_doc.destroy 
        flash[:success] = "Document deleted"
        @user = User.find(@e_doc.user_id)
        @user.DLerr = ((@user.DLerr.to_i) +1).to_s
        @user.save
      else     
        flash[:danger] = "Delete fail"
      end
    else
        if @e_doc.destroy 
          flash[:success] = "Document deleted"
        else     
          flash[:danger] = "Delete fail"
        end
    end
      redirect_to request.referrer || root_url
  end


  def cmtfeed 
    @comment = current_edoc.comments.build
    @feed_cmts = current_edoc.cmtfeed.paginate page: params[:page]
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_e_doc
      @e_doc = EDoc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def e_doc_params
      params.require(:e_doc).permit  :file, :description, :category_id, :docname
    end

    def correct_user
      @e_doc = EDoc.find_by(id: params[:id])
      idUser = @e_doc.user_id
      @User= User.find_by(id: idUser)
      @e_docdel = @User.e_docs.find_by(id: params[:id])
      return if @e_docdel
      flash[:danger] = "invalid"
      redirect_to request.referrer || root_url 
    end
end
