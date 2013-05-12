class LawsuitsController < ApplicationController
  
  def create
    user = User.find_by_remember_token(params[:session][:remember_token])
    if user
      sue = Lawsuit.new(params[:session][:lawsuit])
      if sue.save
        @response = { title: sue.title, content: sue.content, type: sue.type, user_id: sue.user_id, success: "true", id: sue.id}
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
      @response = { lawsuit: lawsuit }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end

  def update
    user = User.find_by_remember_token(params[:session][:remember_token])
    sue = Lawsuit.find_by_id(params[:session][:lawsuit][:id]) 
    if sue && user
      if sue.user == user
        if sue.update_attributes(content: params[:session][:lawsuit][:content])
          @response = { title: sue.title, content: sue.content, type: sue.type, user_id: sue.user_id, success: "true", id: sue.id}
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
    user = User.find_by_remember_token(params[:session][:remember_token])
    sue = Lawsuit.find_by_id(params[:session][:lawsuit_id]) 
    if sue && user
      if sue.user == user
        sue.destroy
        @response = { success: "true" }
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

end
