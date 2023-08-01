import { LightningElement,track,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getRecordUi } from 'lightning/uiRecordApi';
import id from '@salesforce/user/Id'
import {Name} from '@salesforce/schema/User.Name'
import {Email} from '@salesforce/schema/User.Email'
//const fields={Name,Email}

export default class LearnWireServicces extends LightningElement {
     fields={Name,Email}
    userId=id
    userFields
    @wire(getRecordUi,{userId:userId,fields})
     name(params) {
        this.userFields=params.data.field
        
    }
}