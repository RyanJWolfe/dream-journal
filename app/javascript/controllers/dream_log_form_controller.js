import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["dreamBody", "rememberDreamCB"]

    connect() {
        if (this.rememberDreamCBTarget.checked) {
            this.toggleDreamBody()
        }
    }

    toggleDreamBody() {
        this.dreamBodyTarget.classList.toggle('hidden')
    }
}
