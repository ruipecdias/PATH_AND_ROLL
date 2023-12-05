// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener('DOMContentLoaded', function () {
    const assistantBtn = document.getElementById('chatGptAssistantBtn');
    const sendMessageBtn = document.getElementById('sendMessageBtn');
    const userInput = document.getElementById('userInput');
    const chatContent = document.getElementById('chatContent');
  
    assistantBtn.addEventListener('click', function () {
      // Open the chat modal
      $('#chatGptModal').modal('show');
    });
  
    sendMessageBtn.addEventListener('click', function () {
      const message = userInput.value.trim();
      if (message) {
        // Display the user's message in chat
        chatContent.innerHTML += `<div>User: ${message}</div>`;
        // Send the message to ChatGPT for processing (Step 4)
        sendToChatGpt(message);
        userInput.value = '';
      }
    });
  });