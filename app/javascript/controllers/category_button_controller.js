import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  static targets = ["one", "two", "three", "four", "choicebutton-one", "choicebutton-two", "choicebutton-three", "choicebutton-four",]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  enableone() {
    console.log(event);
    // Enable the right Element, disable all others
    this.oneTarget.classList.remove("d-none");
    this.twoTarget.classList.add("d-none");
    this.threeTarget.classList.add("d-none");
    this.fourTarget.classList.add("d-none");
    // disable clicked button
    this.choicebuttononeTarget.setAttribute("disabled");
  }

  enabletwo() {
    console.log(event);
    this.twoTarget.classList.remove("d-none");
    this.oneTarget.classList.add("d-none");
    this.threeTarget.classList.add("d-none");
    this.fourTarget.classList.add("d-none");
  }

  enablethree() {
    console.log(event);
    this.threeTarget.classList.remove("d-none");
    this.oneTarget.classList.add("d-none");
    this.twoTarget.classList.add("d-none");
    this.fourTarget.classList.add("d-none");
  }

  enablefour() {
    console.log(event);
    this.oneTarget.classList.add("d-none");
    this.twoTarget.classList.add("d-none");
    this.threeTarget.classList.add("d-none");
    this.fourTarget.classList.remove("d-none");
  }
}
