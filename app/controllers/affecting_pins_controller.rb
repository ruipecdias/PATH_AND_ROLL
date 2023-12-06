class AffectingPinsController < ApplicationController
  before_action :authenticate_user!

  def toggle_pin
    @incident = Incident.find(params[:id])
    @affecting_pin = @incident.affecting_pins.find_or_initialize_by(user: current_user)

    if @affecting_pin.persisted?
      @affecting_pin.destroy
      @is_affected = false
    else
      @affecting_pin.save
      @is_affected = true
    end

    respond_to do |format|
      format.html { redirect_to incidents_path(last_incident_id: @incident.id) }
      format.js   # Add this line to handle AJAX requests
    end
  end
end
