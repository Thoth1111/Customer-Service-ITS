import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-messages"
export default class extends Controller {
  static targets = ["noticeContainer", "alertContainer", "noticeMessage", "alertMessage"]
  connect() {
    this.clearMessages()
  }

  clearMessages(){
    if (this.noticeMessageTarget.innerHTML.trim() !== "") {
      this.noticeContainerTarget.classList.remove('hidden');
      setTimeout(() => {
        this.noticeContainerTarget.classList.add('hidden');
        this.noticeMessageTarget.innerHTML = "";
      }, 5000);
    }

    if (this.alertMessageTarget.innerHTML.trim() !== "") {
      this.alertContainerTarget.classList.remove('hidden');
      setTimeout(() => {
        this.alertContainerTarget.classList.add('hidden');
        this.alertMessageTarget.innerHTML = "";
      }, 5000);
    }
  }
}
