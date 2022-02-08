import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  static targets = ["topic"]
  click(event) {
    event.preventDefault()
    console.log(topicTarget)

  }
}
