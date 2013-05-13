class VotesController < ApplicationController
  
  def create
    user = User.find_by_remember_token(params[:remember_token])
    lawsuit = Lawsuit.find_by_id(params[:vote][:lawsuit_id])
    if user && lawsuit
      vote = Vote.new(params[:vote])
      if vote.save
        plus = Vote.vote_count_type(params[:vote][:lawsuit_id], true)
        minus = Vote.vote_count_type(params[:vote][:lawsuit_id], false)
        @response = { vote: vote, favor: plus, against: minus, success: "true"}
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
    user = User.find_by_remember_token(params[:remember_token])
    if user
      votes = Vote.find_by_user_id(user.id).paginate(page: params[:page])
      @response = { votes: votes, success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end  
  end

  def show
  end
  
  def edit
  end

  def destroy
  end
end
