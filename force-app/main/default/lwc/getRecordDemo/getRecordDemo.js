import { LightningElement,wire,api } from 'lwc';
import { getRecord,getFieldValue,getFieldDisplayValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import OWNER_NAME_FIELD from '@salesforce/schema/Account.Owner.Name'
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue'
export default class GetRecordDemo extends LightningElement {
    name
    owerName
    annualRevenue
    fieldName=[NAME_FIELD,OWNER_NAME_FIELD,ANNUAL_REVENUE_FIELD]
@api recordId
    // @wire(getRecord,{recordId:'$recordId',fields:[NAME_FIELD,OWNER_NAME_FIELD,ANNUAL_REVENUE_FIELD]})
    // getRecordVal({data,error}){
    //     if(data)
    //     {   
    //         console.log('record data is ', data)
    //         this.annualRevenue=data.fields.AnnualRevenue.displayValue
    //         this.owerName=data.fields.Owner.displayValue?data.fields.Owner.displayValue:data.fields.Owner.value.id
    //         this.name=data.fields.Name.displayValue?data.fields.Name.displayValue:data.fields.Name.value
    //     }
    //     else
    //     console.error('Error occured - ',error)
    // }

    @wire(getRecord,{recordId:'$recordId',fields:[NAME_FIELD,OWNER_NAME_FIELD,ANNUAL_REVENUE_FIELD]})
    getRecordVal({data,error}){
        if(data)
        {   
            console.log('record data is ', data)
            this.annualRevenue=getFieldValue(data,ANNUAL_REVENUE_FIELD)
            this.owerName=getFieldValue(data,OWNER_NAME_FIELD)
            this.name=getFieldValue(data, NAME_FIELD)
        }
        else
        console.error('Error occured - ',error)
    }
    
}