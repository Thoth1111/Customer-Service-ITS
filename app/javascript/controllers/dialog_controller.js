import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from "stimulus-use"

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["accountDialog"]
  connect() {
    useClickOutside(this)
  }

  clickOutside() {
    this.accountDialogTarget.close()
  }

  openAccountDialog() {
    this.accountDialogTarget.showModal();
    document.body.classList.add('overflow-hidden');
  }
}
