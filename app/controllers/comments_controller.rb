class CommentsController < ApplicationController
  def index
    @incident = Incident.find(params[:incident_id])
    @comments = @incident.comments
  end

  def create
    @incident = Incident.find(params[:incident_id])
    @comment = @incident.comments.new(comment_params)
    @comment.user = current_user # Assuming you have a current_user method

    if @comment.save
      redirect_to incident_comments_path(@incident), notice: 'Comment was successfully created.'
    else
      render 'incidents/comments' # Adjust this path based on your view structure
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :img_url) # Include other fields as needed
  end

end
