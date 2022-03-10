import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // set stimulus targets
  static targets = [
    "choicecontainer",
    "choicebuttonone",
    "choicebuttontwo",
    "choicebuttonthree",
    "choicebuttonfour"
  ];

  enableone(event) {
    event.preventDefault()
    // Enable the right Element, disable all others
    let catOne = document.querySelector(".categories-choice-one").innerHTML;

    this.choicecontainerTarget.innerHTML = catOne;
    // disable clicked button
    this.choicebuttononeTarget.setAttribute("disabled", "");
    this.choicebuttontwoTarget.removeAttribute("disabled", "");
    this.choicebuttonthreeTarget.removeAttribute("disabled", "");
    this.choicebuttonfourTarget.removeAttribute("disabled", "");
  }

  enabletwo(event) {
    event.preventDefault()
    // Enable the right Element, disable all others
    let catTwo = document.querySelector(".categories-choice-two").innerHTML;
    this.choicecontainerTarget.innerHTML = catTwo;
    // disable clicked button
    this.choicebuttononeTarget.removeAttribute("disabled", "");
    this.choicebuttontwoTarget.setAttribute("disabled", "");
    this.choicebuttonthreeTarget.removeAttribute("disabled", "");
    this.choicebuttonfourTarget.removeAttribute("disabled", "");
  }

  enablethree(event) {
    event.preventDefault()
    // Enable the right Element, disable all others
    let catThree = document.querySelector(".categories-choice-three").innerHTML;

    this.choicecontainerTarget.innerHTML = catThree;
    // disable clicked button
    this.choicebuttononeTarget.removeAttribute("disabled", "");
    this.choicebuttontwoTarget.removeAttribute("disabled", "");
    this.choicebuttonthreeTarget.setAttribute("disabled", "");
    this.choicebuttonfourTarget.removeAttribute("disabled", "");
  }

  enablefour(event) {
    event.preventDefault()
    // get DOM Element
    let catFour = document.querySelector(".categories-choice-four").innerHTML;
    // Fill container body
    this.choicecontainerTarget.innerHTML = catFour;
    // disable clicked button & enable others
    this.choicebuttononeTarget.removeAttribute("disabled", "");
    this.choicebuttontwoTarget.removeAttribute("disabled", "");
    this.choicebuttonthreeTarget.removeAttribute("disabled", "");
    this.choicebuttonfourTarget.setAttribute("disabled", "");
  }

}
