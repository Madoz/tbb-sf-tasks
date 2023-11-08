import { LightningElement } from 'lwc';
import getCustomers from '@salesforce/apex/externalApiController.getCustomers';

export default class CustomerApi extends LightningElement {
  dataReady = false;
  apidata;
  handleClick(){
      this.dataReady = false;
      getCustomers({}).then(resp => {
          this.apidata = JSON.parse(resp);
          this.dataReady = true;
      })
  }
}