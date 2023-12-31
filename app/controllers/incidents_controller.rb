class IncidentsController < ApplicationController

  def new
    @user_street_address = session[:userStreetAddress]
    @incident = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user = current_user

    uploaded_files = params[:incident][:photos]
    path = File.join Rails.root, 'public', 'uploads'
    FileUtils.mkdir_p(path) unless File.exist?(path)
    # Save the file to a specific location
      uploaded_files.reject{|f| f == ""}.each do |uploaded_file|
        File.open(File.join(path, uploaded_file.original_filename), 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end

    if @incident.save
      redirect_to dashboard_path, notice: 'Incident was successfully created.'
    else
      render :new
    end
  end

  def show
    @incident = Incident.find(params[:id])
    @markers = [
      {
        lat: @incident.latitude,
        lng: @incident.longitude,
        url: incident_path(@incident),
        marker_html: render_to_string(partial: "marker", locals: { incident: @incident })
      }
    ]
  end

  def index
    puts "Mapbox API Key: #{ENV['MAPBOX_API_KEY']}"
    @incidents = Incident.all
    @today_incidents = incidents_today

    @markers = @incidents.geocoded.map do |incident|
      {
        lat: incident.latitude,
        lng: incident.longitude,
        url: incident_path(incident),
        marker_html: render_to_string(partial: "marker", locals: { incident: incident })
      }
    end
  end

  def destroy
    @incident = Incident.find(params[:id])
    if @incident.user == current_user
      @incident.destroy
      flash[:notice] = "Incident successfully deleted."
      redirect_to dashboard_path
    else
      flash[:alert] = "You are not authorized to delete this incident."
      redirect_to dashboard_path
    end
  end

end

private

def incident_params
  params.require(:incident).permit(:location, :category, :description, :status, photos: [])
end

def incidents_today
  selected_location = [38.709460, -9.128540]
  radius = 10 # in kilometers
  Incident.where("created_at >= ?", Time.zone.now.beginning_of_day)
          .near(selected_location, radius)
end
