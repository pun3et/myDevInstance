import { LightningElement,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import NAME_FIELD from '@salesforce/schema/Account.Name'
import ACCOUNTNUMBER_FIELD from '@salesforce/schema/Account.AccountNumber'
import BILLINGCITY_FIELD from '@salesforce/schema/Account.BillingCity'

export default class LightningDataServiceRecordForms extends LightningElement {
    @api recordId
    @api objectApiName
    objName=ACCOUNT_OBJECT
    fields=[NAME_FIELD,ACCOUNTNUMBER_FIELD,BILLINGCITY_FIELD]
    
    handleSuccess(event){
        const toastMsgEvent= new ShowToastEvent({
            title:'My first record form',
            message:`record created and Id is ${event.detail.id}`,
            variant:'success',
            
        })
        this.dispatchEvent(toastMsgEvent)
    }
    handleCancel(){
        alert('Hi, You cancelled the data!')
    }
}