import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="emails"
export default class extends Controller {
  connect() {
    console.log("Connected to emails_controller")
    console.log(this.element)
  }

  toggle(e) {
    const id = e.target.dataset.id
    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(`/emails/${id}/toggle`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ read: e.target.checked })
    })
      .then(response => response.json())
      .then(data => {
        alert(data.message)
      })
  }
}
