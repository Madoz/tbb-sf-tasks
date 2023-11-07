import { LightningElement, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList'

export default class TextDisplayer extends LightningElement {
  @track contacts;
  @track errors;

  handleLoad(){
    getContactList()
    .then(result => {
      // callback methods
      this.contacts = result;
    })
    .catch(error => {
      this.error = error;
    })
  }
}
