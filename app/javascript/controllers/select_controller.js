import { Controller } from "@hotwired/stimulus"
import Choices from "choices.js";

export default class extends Controller {
  static targets = [ "dropdown" ]
  connect() {
    this.initializeSelect()
  }

  initializeSelect () {
    new Choices(this.dropdownTarget, {
      removeItemButton: true, // Adds a button to remove selected items
    });
  }

  filterTechnologies (event) {
    this.dropdownTarget.form.requestSubmit();
  }
}
