import {Controller} from "@hotwired/stimulus";
import {toast} from "../utils/alert";

export default class ImageController extends Controller
{
    initialize() {
        this.handler = async function (e) {
            const file = e.target.files[0];

            if (!file) {
                await toast('error','Veuillez sélectionner un fichier', 5000)
                return;
            }

            const data = new FormData();
            data.append('file', file);

            try {
                const response = await fetch('http://localhost:5000/detect', {
                    method: 'POST',
                    body: data
                });

                if (response.ok) {
                    const response = await response.json();
                    await toast('success', `Animal détecté : ${response['detection']}`, 5000)
                   document.querySelector("#animal_race").value = response['detection']
                } else {
                   await toast('error', "Désolé une erreur s'est produite lors de la détection", 5000)
                }
            } catch (error) {
                await toast('error', "Désolé une erreur s'est produite lors de la détection", 5000)
                console.log(error)
            }
        }
        super.initialize()
    }

    connect() {
        this.element.addEventListener('change', this.handler, false)
    }

    disconnect() {
        this.element.removeEventListener('change', this.handler, false)
    }
}
