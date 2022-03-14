import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["dreamBody", "rememberDreamCB", "haveDreamCB", "remember"]

    connect() {
        if (this.haveDreamCBTarget.checked) {
            this.toggleRemember()
        }
        if (this.rememberDreamCBTarget.checked) {
            this.toggleDreamBody()
        }
    }

    toggleDreamBody() {
        this.dreamBodyTarget.classList.toggle('hidden')
    }

    toggleRemember() {
        this.rememberTarget.classList.toggle('hidden')
    }
}
