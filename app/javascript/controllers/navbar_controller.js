import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["link"];

  connect() {
    // Highlight the active link based on the current URL
    this.setInActiveLink()
    this.setActiveLink()
  }

  setActiveLink(event) {
    let link = this.linkTargets.find(link => window.location.href.includes(link.href));
    // Add active styles to the clicked link
    if(!link) return;
    link.classList.add("bg-gray-900", "text-white");
    link.classList.remove("text-gray-300", "hover:bg-gray-700", "hover:text-white");
  }

  setInActiveLink() {
    // Remove active styles from active link
    let link = this.linkTargets.find(link => link.classList.contains("bg-gray-900"));
    if(!link) return;
    link.classList.remove("bg-gray-900", "text-white");
    link.classList.add("text-gray-300", "hover:bg-gray-700", "hover:text-white");
  }

  toggleManu(event) {
    let element = event.currentTarget;
    let menu = element.getAttribute('aria-controls')
    document.getElementById(menu).classList.toggle('hidden');
  }
}
