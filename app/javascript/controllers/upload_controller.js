import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "preview" ]
  connect() {
  }

  preview (event) {
    Array.from(event.target.files).map(file => {
      let preview = this.previewTarget;
      preview.src = URL.createObjectURL(file);
      preview.classList.remove("hidden");
    })
  }

  previews (event) {
    let preview = this.previewTarget;
    let previewParent = preview.parentNode;
    previewParent.querySelectorAll('label[data-upload-target="preview"]:not(:first-child)')
        .forEach(child => {
          child.remove();
        });
    Array.from(event.target.files).map((file, index) => {
      let image = preview.querySelector('img');
      let previewClone = preview.cloneNode(true);
      if(index) {
        previewParent.appendChild(previewClone);
        image = previewClone.querySelector('img');
      }
      image.src = URL.createObjectURL(file);
      image.classList.remove("hidden");
    })
  }
}
