import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "yearToggler", "yearSelector"]
  connect() {
    const date = this.
  }

  showYearSelector(){
    this.yearSelectorTarget.classList.remove('hidden')
  }

  changeYear(e){
    const year = e.target.value;
  }
}