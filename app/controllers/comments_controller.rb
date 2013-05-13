class CommentsController < ApplicationController

  def create
    user = User.find_by_remember_token(params[:remember_token])
    lawsuit = Lawsuit.find_by_id(params[:comment][:lawsuit_id])
    if user && lawsuit
      comment = Comment.new(params[:comment])
      if comment.save
        @response = { comment: comment, success: "true"}
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
    user = User.find_by_id(params[:id])
    if user
      comments = user.comments.paginate(page: params[:page])
      @response = { comments: comments, success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end
  
  def show
    comment = Comment.find_by_id(params[:id])
    if comment
      @response = { comment: comment, success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end

  def update
    user = User.find_by_remember_token(params[:remember_token])
    comment = Comment.find_by_id(params[:id])
    if user && comment && comment.user == user
      if comment.update_attributes(text: params[:text])
        @response = { comment: comment, success: "true" }
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
    comment = Comment.find_by_id(params[:id])
    if user && comment && comment.user == user
      comment.destroy
      @response = { success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end
end
