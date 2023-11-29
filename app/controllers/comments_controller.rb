class CommentsController < ApplicationController
  def index
    @incident = Incident.find(params[:incident_id])
    @comments = @incident.comments
  end
end
