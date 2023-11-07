import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountSearchController.getAccounts';

export default class AccountSearcher extends LightningElement {
  @track accountName = '';
  @track accountList = [];
  @track accountId;
  @track showSearchedValues = false;

  @wire(getAccounts, {accountName: '$accountName'})
  retrieveAccounts({error, data}){
    if(data){
      this.accountList = data;
      this.showSearchedValues = data.length > 0;
    } else if (error){
      console.error(error);
    }
  }

  handleKeyChange(event){
    this.accountName = event.target.value;
  }

  handleParentSelection(event){
    this.accountId = event.target.dataset.value;
    this.accountName = event.target.dataset.label;
    const selectedEvent = new CustomEvent('selected', {detail: this.accountId });
    this.dispatchEvent(selectedEvent);
    this.showSearchedValues = false;
  }
}