import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["accountDialog"]
  
  clickOutside(event) {
    if (event.target === this.accountDialogTarget) {
      this.accountDialogTarget.close()
    }
  }

  openAccountDialog() {
    this.accountDialogTarget.showModal();
    document.body.classList.add('overflow-hidden');
  }
}
