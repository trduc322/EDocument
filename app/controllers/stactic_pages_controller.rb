class StacticPagesController < ApplicationController


  def help
  end

  def about
  end

  def home
    #if login?
    
    @e_doc = EDoc.select "*"
    @feed_items = @e_doc.paginate page: params[:page]
    #end
   
    
  
  end
end
