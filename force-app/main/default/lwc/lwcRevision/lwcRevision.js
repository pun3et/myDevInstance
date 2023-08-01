import { LightningElement,wire } from 'lwc';
import USER_OBJ from '@salesforce/schema/User' 
import user_ID from '@salesforce/user/Id'
import USER_NAME from '@salesforce/schema/User.Username'
import NAMEOFUSER from '@salesforce/schema/User.Name'
import USER_EMAIL from '@salesforce/schema/User.Email'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import ACCOUNT_NAME from '@salesforce/schema/Account.Name'
import ACCOUNT_ID from '@salesforce/schema/Account.id'
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone'
import ACCOUNT_REVENUE from '@salesforce/schema/Account.AnnualRevenue'
import { getRecord } from 'lightning/uiRecordApi';
var userFields=[USER_NAME,NAMEOFUSER,USER_EMAIL]
export default class LwcRevision extends LightningElement {
    
    
    userObj=USER_OBJ
    userId=user_ID
    
    Account=ACCOUNT_OBJECT
    fields=[ACCOUNT_NAME,ACCOUNT_PHONE,ACCOUNT_REVENUE,ACCOUNT_ID]

    @wire(getRecord,{recordId:'$userId',fields:userFields})
    fetchedRecord({data,error}){

        if(data){
            console.log('fetchedRecord ',data)
        }
    }
    
    handleCancel(event){

        this.template.querySelector('lightning-record-form').reset()

    }
}