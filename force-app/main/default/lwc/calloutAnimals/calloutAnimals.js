import { LightningElement,wire } from 'lwc';
import fetchAnimals from '@salesforce/apex/AnimalsServiceHandler.fetchAnimals';
export default class DisplayAnimals extends LightningElement {
    animals;
    error
    handleClick(){
        fetchAnimals()
            .then(result => {
                this.animals = result;
                console.log(' this.animals '+JSON.stringify( this.animals ));
            })
            .catch(error => {
                this.error = error;
            });
    }
}