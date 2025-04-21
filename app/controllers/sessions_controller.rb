class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == ENV["CUSTOMER_USER"] && params[:password] == ENV["CUSTOMER_PASS"]
      session[:customer] = true
      redirect_to skippers_path # Customers go to the skippers index
    else
      flash[:alert] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    session[:customer] = nil
    redirect_to root_path
  end
end
