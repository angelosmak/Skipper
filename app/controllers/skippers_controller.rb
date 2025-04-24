class SkippersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_skipper, only: [ :show, :edit, :update ]

  # # For skippers to see their own dashboard
  def dashboard
    @skipper = Skipper.find(session[:skipper_id])
  end


  # For customers to see all skippers
  def index
    @skippers = Skipper.all
  end

  # For customers to view a specific skipper's profile
  def show
    @skipper = Skipper.find(params[:id])

    # Use params[:month] if present, or default to the current month
    @current_month = if params[:month]
      Date.parse("#{params[:month]}-01")
    else
      Date.today.beginning_of_month
    end

    @days_in_month = (@current_month.beginning_of_month..@current_month.end_of_month).to_a
    @booked_dates = @skipper.bookings.where(date: @days_in_month).pluck(:date)

    if turbo_frame_request?
      render partial: "calendar", locals: {
        skipper: @skipper,
        current_month: @current_month,
        booked_dates: @booked_dates
      }
    end
  end


  # Edit and update skipper's own profile
  def edit
  end

  def update
    # Fetch the skipper by ID
    @skipper = Skipper.find(params[:id])

    # Check if the skipper's email is changing
    email_changed = @skipper.email != skipper_params[:email]

    # Attempt to update the skipper's attributes
    if @skipper.update(skipper_params)
      # If the email is changing, update the related User's email
      if email_changed
        @user = @skipper.user
        if @user.update(email: @skipper.email)
          flash[:notice] = "Profile and user email updated successfully!"
        else
          flash[:alert] = "Error updating user email."
        end
      end

      # Redirect to the skipper"s profile page or render edit if validation fails
      redirect_to @skipper, notice: "Profile updated successfully!"
    else
      render :edit
    end
  end

  private

  def set_skipper
    @skipper = Skipper.find(params[:id])
  end

  def skipper_params
    params.require(:skipper).permit(:name, :bio, :email, :video, :cv, :docs, :image_url)
  end

  # def authenticate_skipper!
  #   unless session[:skipper_id] == @skipper.id
  #     redirect_to root_path, alert: "Not authorized"
  #   end
  # end
end
