import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "yearToggler", "yearSelector"]
  connect() {
  }

  showYearSelector(){
    this.yearSelectorTarget.classList.remove('hidden')
  }

  changeYear(e){
    const year = e.target.value;
    @date = new
  }
}
