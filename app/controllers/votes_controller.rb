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
    user = User.find_by_remember_token(params[:remember_token])
    if user
      vote = Vote.find_by_id(user.id)
      if vote
        @response = { vote: vote, success: "true" }
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
  
  def edit
    user = User.find_by_remember_token(params[:remember_token])
    vote = Vote.find_by_id(params[:id])
    if user && vote && vote.user == user
      if vote.update_attributes(positive: params[:decide])
        @response = { vote: vote, success: "true" }
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

  def destroy
    user = User.find_by_remember_token(params[:remember_token])
    vote = Vote.find_by_id(params[:id])
    if user && vote && vote.user == user
      vote.destroy
      @response = { success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end  
  end

end
