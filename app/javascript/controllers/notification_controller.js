import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"];

  connect() {
    if (this.hasContainerTarget) {
      this.showNotification();
      setTimeout(() => {
        this.hideNotification();
      }, 3000);
    }
  }

  // Function to show notification
  showNotification() {
    const notification = this.element;
    notification.className = `fixed top-13 right-0 z-50 text-white px-2 py-4 transform transition-transform duration-300`;

    // Show notification
    notification.classList.remove('translate-x-full');
  }

  hideNotification() {
    this.element.classList.add('translate-x-full');
  }

}
