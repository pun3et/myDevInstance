import { LightningElement,wire } from 'lwc';
import USER_Id from '@salesforce/user/Id'
import { getRecord } from 'lightning/uiRecordApi';
import USERNAME from '@salesforce/schema/User.userName'
import NAME from '@salesforce/schema/user.Name'
//Getting Obj Info now
import { getObjectInfo,getObjectInfos } from 'lightning/uiObjectInfoApi';
import ACCOUNT from '@salesforce/schema/Account'
import CONT from '@salesforce/schema/Contact'
var fields=[USERNAME,NAME]

export default class WireCmpDemo extends LightningElement {
    userId=USER_Id
    objApiName=[ACCOUNT,CONT]
    defaultRecTypeId
    //Wire syntax
    // @wire(adapter,{adapterConfig})
    // propertyOrFunction

    @wire(getRecord,{recordId:'$userId',fields})
    userDetailHandler({data,error}){
        if(data){
            console.log('response',data)
            this.wireResponse=data.fields
           console.log('this.wireResponse',this.wireResponse)
        }
        
        else
        console.log('response'+error)
    }


    @wire(getObjectInfo,{objectApiName:ACCOUNT})
    objDetails({data,error}){
        if(data){
        this.defaultRecTypeId=data.defaultRecordTypeId
        console.log('response Obj is ', data)
        console.log('defaultRecTypeId is ', this.defaultRecTypeId)
        }
        else
        console.error(error)
    }

    @wire(getObjectInfos,{objectApiName:[ACCOUNT]})
    getObjInfos({data,error}){
        if(data){
                console.log('obj infos data is',data)
        }
        else
        console.error('error occured',error)
    }
}