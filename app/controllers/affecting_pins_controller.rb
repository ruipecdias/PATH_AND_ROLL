class AffectingPinsController < ApplicationController
  before_action :authenticate_user!

  def create
    @incident = Incident.find(params[:incident_id])
    @affecting_pin = @incident.affecting_pins.find_or_initialize_by(user: current_user)

    if @affecting_pin.persisted?
      @affecting_pin.destroy
      is_affected = false
    else
      @affecting_pin.save
      is_affected = true
    end

    render json: { is_affected: is_affected, affecting_pins_count: @incident.affecting_pins.count }
  end
end
