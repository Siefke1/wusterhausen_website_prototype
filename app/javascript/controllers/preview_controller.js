import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  click() {
    console.log("hello joe")
  }
  connect() {
    const inpFile = document.getElementById('inpFile');
    const previewContainer = document.getElementById('image-preview');
    const previewImage = previewContainer.querySelector('.image-preview__image');
    const previewDefaultText = previewContainer.querySelector('.image-preview__default-text');

    inpFile.addEventListener("change",function() {
    const file = this.files[0];
    console.log(file);

    if (file) {
      const reader = new FileReader();
      previewDefaultText.style.display = "none";
      previewImage.style.display = "block";

      reader. addEventListener("load", function() {
        console.log(this)
        previewImage.setAttribute("src", this.result);
      });
      reader.readAsDataURL(file)
    }
    else {
      previewDefaultText.style.display = null;
      previewImage.style.display = null;
      previewImage.setAttribute("src", "");
    }
  })
  }


}
