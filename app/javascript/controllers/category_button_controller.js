import { Controller } from "@hotwired/stimulus"

let catOne = document.querySelector(".categories-choice-one").innerHTML
let catTwo = document.querySelector(".categories-choice-two").innerHTML
let catThree = document.querySelector(".categories-choice-three").innerHTML
let catFour = document.querySelector(".categories-choice-four").innerHTML

export default class extends Controller {
  static targets = ["choicecontainer", "choicebuttonone", "choicebuttontwo", "choicebuttonthree", "choicebuttonfour",]



  enableone() {
    console.log(event);
    // Enable the right Element, disable all others

    this.choicecontainerTarget.innerHTML = catOne;
    // disable clicked button
    this.choicebuttononeTarget.setAttribute("disabled", "");
    this.choicebuttontwoTarget.removeAttribute("disabled", "");
    this.choicebuttonthreeTarget.removeAttribute("disabled", "");
    this.choicebuttonfourTarget.removeAttribute("disabled", "");
  }

  enabletwo() {
    console.log(event);
    // Enable the right Element, disable all others
    this.choicecontainerTarget.innerHTML = catTwo;
    // disable clicked button
    this.choicebuttononeTarget.removeAttribute("disabled", "");
    this.choicebuttontwoTarget.setAttribute("disabled", "");
    this.choicebuttonthreeTarget.removeAttribute("disabled", "");
    this.choicebuttonfourTarget.removeAttribute("disabled", "");
  }

  enablethree() {
    console.log(event);
    // Enable the right Element, disable all others
    this.choicecontainerTarget.innerHTML = catThree;
    // disable clicked button
    this.choicebuttononeTarget.removeAttribute("disabled", "");
    this.choicebuttontwoTarget.removeAttribute("disabled", "");
    this.choicebuttonthreeTarget.setAttribute("disabled", "");
    this.choicebuttonfourTarget.removeAttribute("disabled", "");
  }

  enablefour() {
    console.log(event);
    // Enable the right Element, disable all others
    this.choicecontainerTarget.innerHTML = catFour;
    // disable clicked button
    this.choicebuttononeTarget.removeAttribute("disabled", "");
    this.choicebuttontwoTarget.removeAttribute("disabled", "");
    this.choicebuttonthreeTarget.removeAttribute("disabled", "");
    this.choicebuttonfourTarget.setAttribute("disabled", "");
  }
}
