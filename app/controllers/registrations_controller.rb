class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_registration_url, alert: "Try again later." }

  # GET /registrations/new
  def new
    @registration = User.new
  end

  # POST /registrations or /registrations.json
  def create
    @registration = User.new(registration_params)
    respond_to do |format|
      if @registration.save
        start_new_session_for @registration
        format.html { redirect_to after_authentication_url, notice: "Welcome #{@registration.full_name}!" }
        format.json { render json: @registration, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def registration_params
      params.expect(user: [ :first_name, :last_name, :email_address, :password, :password_confirmation ])
    end
end
