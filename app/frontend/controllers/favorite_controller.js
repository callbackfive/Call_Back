import { Controller } from "stimulus"
import ax from 'axios'
export default class extends Controller {
  static targets = [ "icon" ]

  toggle_like(e) {
    e.preventDefault();
    const id = this.data.get('id')
    const token = document.querySelector('[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-TOKEN'] = token

    ax.post(`/projects/${id}/favorite`, {})
      .then((resp) => {
        if (resp.data.status == "added") {
          this.iconTarget.classList.remove("far")
          this.iconTarget.classList.add("fas")
        } else {
          this.iconTarget.classList.remove("fas")
          this.iconTarget.classList.add("far")
        }
      })
    }
  }

