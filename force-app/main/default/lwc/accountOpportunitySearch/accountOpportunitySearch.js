import { LightningElement } from 'lwc';

export default class AccountOpportunitySearch extends LightningElement {
    queryterm;

    handleKeyUp(event){
        const isEnterKey = event.keyCode === 13;
        if(isEnterKey){
            this.queryterm = event.target.value;
        }

        console.log('Searched Term in Child :', this.queryterm);

        const searchEvent = new CustomEvent('search', {
            detail: this.queryterm
        });

        this.dispatchEvent(searchEvent);

    }
}