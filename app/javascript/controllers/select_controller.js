import {Controller} from "@hotwired/stimulus"
import TomSelect from "tom-select";

export default class SelectController extends Controller {
    connect() {
        const selects = this.element.querySelectorAll("select")

        selects.forEach(select => {
            if (select.multiple) {
                new TomSelect(`#${select.id}`, {
                    maxItems: 6
                })
            }
        })
    }
}
