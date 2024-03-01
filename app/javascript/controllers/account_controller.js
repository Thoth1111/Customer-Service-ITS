import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account"
export default class extends Controller {
  static targets = ["activeField", "hiddenField"]
  connect() {
  }

  showFields() {
    this.hiddenFieldTargets.forEach(element => {
      element.classList.remove('hidden');
    });
    this.activeFieldTargets.forEach(element => {
      element.classList.add('hidden');
    });
  }

  hideFields() {
    this.hiddenFieldTargets.forEach(element => {
      element.classList.add('hidden');
    });
    this.activeFieldTargets.forEach(element => {
      element.classList.remove('hidden');
    });
  }
}
