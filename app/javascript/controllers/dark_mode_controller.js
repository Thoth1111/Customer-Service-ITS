import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="darkMode"
export default class extends Controller {
  static targets = ["lightModeIcon", "darkModeIcon"]

  initialize() {
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.body.classList.add('dark')
    } else {
      document.body.classList.remove('dark')
    }
  }

  toggleDarkMode() {
    if (localStorage.theme === 'dark') {
      localStorage.theme = 'light'
      this.lightModeIconTarget.classList.add('hidden')
      this.darkModeIconTarget.classList.remove('hidden')
    } else {
      localStorage.theme = 'dark'
      this.lightModeIconTarget.classList.remove('hidden')
      this.darkModeIconTarget.classList.add('hidden')
    }
    this.initialize()
  }
}
