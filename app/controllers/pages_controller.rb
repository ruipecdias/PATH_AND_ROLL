class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]



  def home
  end

  def dashboard
    @affecting_incidents = current_user.affecting_incidents.limit(3)
    @reported_incidents = current_user.incidents.limit(3)
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

def chat_gpt_response
  user_message = params[:message]
  # Process the message with ChatGPT (or similar AI service)
  response = process_with_chatgpt(user_message)
  render json: { response: response }
end


require 'http'

def process_with_chatgpt(message)
  api_url = "https://api.openai.com/v1/engines/davinci-codex/completions" 
  api_key = "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" # Replace with your actual API key

  headers = {
    "Authorization" => "Bearer #{api_key}",
    "Content-Type" => "application/json"
  }

  body = {
    prompt: message,
    max_tokens: 50 # Adjust as needed
  }.to_json

  response = HTTP.headers(headers).post(api_url, body: body)
  if response.status.success?
    result = JSON.parse(response.body)
    return result["choices"].first["text"].strip
  else
    # Handle error (e.g., log it, notify, return a default message, etc.)
    Rails.logger.error "ChatGPT API Error: #{response.status} - #{response.body}"
    return "I'm having trouble processing your request right now."
  end
end

end