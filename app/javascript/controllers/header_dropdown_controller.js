import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header-dropdown"
export default class extends Controller {
  static targets = ["dropdown",];

  toggle() {
      this.dropdownTarget.classList.toggle('is-active');
  }
}
