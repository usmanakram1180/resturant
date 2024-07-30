// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// app/javascript/packs/application.js
import Rails from "@rails/ujs";
Rails.start();
// app/javascript/packs/application.js
import Rails from "@rails/ujs"
Rails.start()

document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector('form');
    const messageContainer = document.getElementById('message-container');
    
    form.addEventListener('submit', function(event) {
      event.preventDefault();
      
      const formData = new FormData(form);
      
      fetch(form.action, {
        method: 'POST',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Accept': 'application/json'
        },
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        if (response.ok) {
          messageContainer.innerHTML = `<div class="alert alert-success">${data.message}</div>`;
          form.reset(); // Optional: clear the form after successful submission
        } else {
          messageContainer.innerHTML = `<div class="alert alert-danger">${data.errors.join('<br/>')}</div>`;
        }
      })
      .catch(error => {
        messageContainer.innerHTML = `<div class="alert alert-danger">An error occurred. Please try again later.</div>`;
      });
    });
  });
  