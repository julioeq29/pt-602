import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'container', 'modal' ];

  open (e) {
    $(this.modalTarget).modal();
    const projectId = e.currentTarget.dataset.project;
    fetch(`/pages/${projectId}`)
      .then(response => response.text())
      .then((data) => {
        this.containerTarget.innerHTML = data;
      });
  }
}
