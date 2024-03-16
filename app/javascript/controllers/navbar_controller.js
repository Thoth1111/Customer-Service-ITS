import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from "stimulus-use"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navMenu"]
  connect() {
    this.closeMenu();
    useClickOutside(this);
  }

  clickOutside() {
    this.closeMenu();
  }

  closeOnEscape(e) {
    if (e.key === 'Escape') {
      this.closeMenu();
    }
  }

  toggle() {
    if (this.navMenuTarget.classList.contains('hidden')) {
      this.openMenu();
    } else {
      this.closeMenu();
    }
  }

  openMenu() {
    this.navMenuTarget.classList.remove('hidden');
    let main = document.querySelector('main');
    main.classList.add('blur');
    document.body.classList.add('overflow-hidden');
  }

  closeMenu() {
    this.navMenuTarget.classList.add('hidden');
    let main = document.querySelector('main');
    main.classList.remove('blur');
    document.body.classList.remove('overflow-hidden');
  }

}
