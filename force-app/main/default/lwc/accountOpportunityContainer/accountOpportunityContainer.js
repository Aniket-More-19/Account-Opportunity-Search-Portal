import { LightningElement } from 'lwc';
import getAccountInfo from '@salesforce/apex/RetrieveAccountOpportunity.getAccountInfo';

export default class AccountOpportunityContainer extends LightningElement {

    account;
    opportunities;

    handleSearch(event){
        console.log('Search term in parent : ', event.detail);

        getAccountInfo({
            queryterm: event.detail

        }).then((result) => {

            console.log('Result Account:', result.account);
            console.log('Result Opportunities:', result.opportunities);

            this.account = result.account;
            this.opportunities = result.opportunities;

        }).catch((error) => {
            console.log('Error fetching account and opportunities :', error);
        });
        
    }
}