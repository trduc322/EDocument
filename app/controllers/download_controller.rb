class DownloadController < ApplicationController
    include Rails.application.routes.url_helpers
   
  def show
    
    @e_doc ||= EDoc.find_by id: params[:id]
    @user = current_user
    @history = History.find_by user_id: @user.id
    if (@user.id == @e_doc.user_id && @user.coin.to_i >=10)
      if (History.where(:dload => 1).where(:user_id => @user.id).where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).count < 6)
      redirect_to rails_blob_path(@e_doc.file, disposition: "attachment", only_path: true)
      @history = History.new
      @history.user_id = @user.id
      @history.e_doc_id = @e_doc.id
      @history.dload = true
      @history.save
      else
      redirect_to rails_blob_path(@e_doc.file, disposition: "attachment", only_path: true) 
      @user.coin = (@user.coin.to_f - 5).to_s
      @user.save
      @history = History.new
      @history.user_id = @user.id
      @history.e_doc_id = @e_doc.id
      @history.dload = true
      @history.save
      end
    end

    if (@user.id != @e_doc.user_id && @user.coin.to_i >=15)
      if (History.where(:dload => 1).where(:user_id => @user.id).where("created_at BETWEEN ? AND ?", DateTime.now.beginning_of_month, DateTime.now).count < 6) 
      redirect_to rails_blob_path(@e_doc.file, disposition: "attachment", only_path: true)
      @history = History.new
      @history.user_id = @user.id
      @history.e_doc_id = @e_doc.id
      @history.dload = true
      @history.save
        else
      redirect_to rails_blob_path(@e_doc.file, disposition: "attachment", only_path: true) 
      @user.coin = (@user.coin.to_f - 7.5).to_s
      @user.save
      @history = History.new
      @history.user_id = @user.id
      @history.e_doc_id = @e_doc.id
      @history.dload= true
      @history.save
        end
    end


  end


 
private 


end
