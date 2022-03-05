import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"]

  toggle(e) {
    e.stopPropagation()
    this.dropdownTarget.classList.toggle('hidden')
  }

  hide() {
    this.dropdownTarget.classList.add('hidden')
  }
}
