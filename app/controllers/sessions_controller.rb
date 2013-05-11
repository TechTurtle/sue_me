class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      @response = { first_name: user.first_name, last_name: user.last_name, email: user.email, city: user.city, state: user.state, success: "true", remember_token: user.remember_token}
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end
  
  def destroy
    user = User.find_by_remember_token(params[:session][:remember_token])
    if user
      sign_out user
      @response = { success: "true" }
      render json: @response
    else
      @response = { success: "false" }
      render json: @response
    end
  end
end
