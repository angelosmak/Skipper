class DashboardController < ApplicationController
  before_action :authorize_customer

  def index
    @skippers = Skipper.all
  end

  private

  def authorize_customer
    redirect_to login_path unless session[:customer]
  end
end
