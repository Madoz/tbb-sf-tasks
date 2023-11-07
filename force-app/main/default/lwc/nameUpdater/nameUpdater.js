import { LightningElement, api, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactUpdateController.getContactList';
import updateContact from '@salesforce/apex/ContactUpdateController.updateContact';
import {refreshApex} from '@salesforce/apex'

export default class NameUpdater extends LightningElement {
  @track contacts;
  @api contactId;
  @api errorMessage;
  @wire(getContactList) newcontacts;
  handleUpdate(event){
    this.cId = event.target.value;
    updateContact({
      contactId:this.cId
    })
    .then(() => {
      return refreshApex(this.newcontacts)
    })
    .catch((error) => {
      this.errorMessage = error;
    })
  }

  handleLoad(){
    getContactList()
    .then(result => {
      this.contacts = result;
    })
    .catch(error => {
      this.error = error;
    })
  }
}