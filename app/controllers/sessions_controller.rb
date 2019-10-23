# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      flash.now[:success] = "Authentication is OK. Welcome #{user.name}"
    else
      flash.now[:danger] = 'Invalid authentication!!!'
    end
    render :new
  end
end
