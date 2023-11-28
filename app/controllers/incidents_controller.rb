class IncidentsController < ApplicationController
  def show
    @incident = Incident.find(params[:id])
  end
  
  def index
    puts "Mapbox API Key: #{ENV['MAPBOX_API_KEY']}"
    @incidents = Incident.all

    @markers = @incidents.geocoded.map do |incident|
      {
        lat: incident.latitude,
        lng: incident.longitude,
        url: incident_path(incident),
        marker_html: render_to_string(partial: "marker", locals: { incident: incident })
      }
    end
  end

end
