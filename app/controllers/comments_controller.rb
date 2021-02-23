class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  #before_action :edoc_exist, only: [:create]
  before_action :logged_in_user, only: [:create]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find_by id: params[:id]
  end

  # GET /comments/new
  def new
    user = session[:user_id]
    @comment = Comment.new(e_doc_id: params[:e_doc_id])
    @e_doc = EDoc.find(params[:e_doc_id])
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    #@e_doc ||= EDoc.find_by id: params[:id]
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @e_doc_id = params[:id]
      if @comment.save
       flash[:success] = "commment uploaded"
       redirect_to request.referrer
      else
        render "stactic_pages/home"
      end
    
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content,:user_id, :e_doc_id)
    end
end
