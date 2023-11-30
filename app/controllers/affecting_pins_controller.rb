class AffectingPinsController < ApplicationController
  before_action :authenticate_user!

  def toggle_pin
    @incident = Incident.find(params[:id])
    @affecting_pin = @incident.affecting_pins.find_or_initialize_by(user: current_user)

    if @affecting_pin.persisted?
      @affecting_pin.destroy
      is_affected = false
      redirect_to incidents_path
    else
      @affecting_pin.save
      is_affected = true
      redirect_to incidents_path
    end
  end
end
