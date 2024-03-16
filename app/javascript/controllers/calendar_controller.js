import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from "stimulus-use"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "yearSelectorContainer" ]
  connect() {
  }

  toggle(){
    if (this.yearSelectorContainerTarget.classList.contains('hidden')) {
      this.showYearSelector();
    } else {
      this.hideYearSelector();
    }
  }

  showYearSelector(){
    this.yearSelectorContainerTarget.classList.remove('hidden');
  }

  hideYearSelector(){
    this.yearSelectorContainerTarget.classList.add('hidden');
  }
}
