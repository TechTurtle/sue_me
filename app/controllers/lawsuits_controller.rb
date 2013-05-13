class LawsuitsController < ApplicationController
  
  def create
    user = User.find_by_remember_token(params[:remember_token])
    if user
      sue = Lawsuit.new(params[:lawsuit])
      if sue.save
        @response = { lawsuit: sue, success: "true" }
        render json: @response
      else
        @response = { success: "false" }
        render json: @response
      end
    else
      @response = { success: "false" }
      render json: @response
    end
  end

  def index 
    lawsuits = Lawsuit.paginate(page: params[:page])
    @response = { lawsuits: lawsuits }
    render json: @response
  end
 
  def show
    lawsuit = Lawsuit.find_by_id(params[:id])
    if lawsuit
      has_lawsuit = params[:has_lawsuit]
      plus = Vote.vote_count_type(params[:lawsuit_id], true)
      minus = Vote.vote_count_type(params[:lawsuit_id], false)
      if has_lawsuit
        commments = lawsuit.comments.paginate(page: params[:page])
        @response = { comments: comments, favor: plus, against: minus, success: "true" }  
        render json: @response
      else
        commments = lawsuit.comments.paginate(page: params[:page])
        @response = { lawsuit: lawsuit, comments: comments, favor: plus, against: minus, success: "true" }  
        render json: @response 
      end
    else
      @response = { success: "false" }
      render json: @response
    end
  end

  def update
    user = User.find_by_remember_token(params[:remember_token])
    sue = Lawsuit.find_by_id(params[:lawsuit][:id]) 
    if sue && user
      if sue.user == user
        if sue.update_attributes(content: params[:lawsuit][:content])
          @response = { lawsuit: sue, success: "true" }
          render json: @response  
        else
          @response = { success: "false" }
          render json: @response
        end
      else
        @response = { success: "false" }
        render json: @response
      end
    else
      @response = { success: "false" }
      render json: @response
    end
  end

  def destroy
    user = User.find_by_remember_token(params[:remember_token])
    sue = Lawsuit.find_by_id(params[:id]) 
    if sue && user && sue.user == user
      comments = sue.comments

      comments.each do |c|
        c.destroy
      end

      sue.destroy
      @response = { success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end

end
