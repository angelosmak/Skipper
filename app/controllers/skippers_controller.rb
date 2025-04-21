class SkippersController < ApplicationController
  before_action :authenticate_skipper!, only: [:dashboard, :edit, :update]
  before_action :set_skipper, only: [:show, :edit, :update]

  # For skippers to see their own dashboard
  def dashboard
    @skipper = Skipper.find(session[:skipper_id])
  end

  # For customers to see all skippers
  def index
    @skippers = Skipper.all
  end

  # For customers to view a specific skipper's profile
  def show
  end

  # Edit and update skipper's own profile
  def edit
  end

  def update
    if @skipper.update(skipper_params)
      redirect_to skipper_dashboard_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def set_skipper
    @skipper = Skipper.find(params[:id])
  end

  def skipper_params
    params.require(:skipper).permit(:name, :bio, :video, :cv, :docs)
  end

  def authenticate_skipper!
    unless session[:skipper_id] == @skipper.id
      redirect_to root_path, alert: "Not authorized"
    end
  end
end
