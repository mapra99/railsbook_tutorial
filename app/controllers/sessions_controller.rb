# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      remember user
      flash[:success] = "Authentication is OK. Welcome #{user.name}"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid authentication!!!'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'You were correctly logged out'
    redirect_to root_url
  end
end
