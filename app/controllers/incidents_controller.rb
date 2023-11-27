class IncidentsController < ApplicationController
  def show
    @incident = Incident.find(params[:id])
  end
end
