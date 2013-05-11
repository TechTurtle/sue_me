class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if @user.save
      @response = { first_name: @user.first_name, last_name: @user.last_name, email: @user.email, city: @user.city, state: @user.state, success: "true"}
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end

  def show
  end
end
