import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getObjectInfos, getPicklistValues,getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import ACCOUNT from '@salesforce/schema/Account'
import CONT from '@salesforce/schema/Contact'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
export default class ObjectInfosCmp extends LightningElement {
    apiNames=[ACCOUNT,CONT]
    resArr
    resArrSplit
    resJsonArr
    industryOptions
    selectedIndustry=''
    accSource
    selectedSource=''
    accRating
    selectedRating=''
    @wire(getObjectInfos,{objectApiNames:'$apiNames'})
    getObjData({data,error}){
        if(data){
            console.log('the data is ',data)
            this.resArr=data.results
            this.resArrSplit=[...data.results]
            this.resJsonArr=JSON.parse(JSON.stringify(data.results))
            console.log('the results data is ',this.resArr)
            console.log('the results split data is ',this.resArrSplit)
            console.log('the results split data is ',this.resJsonArr)
        }
        else
        console.error('error is', error)
    }
    @wire(getObjectInfo, {objectApiName:ACCOUNT})
    accApiName

    @wire(getPicklistValues,{recordTypeId:'$accApiName.data.defaultRecordTypeId',fieldApiName:INDUSTRY_FIELD})
    industryPicklistValues({data,error}){
        if(data){
            console.log('value of pick data is',data)
            this.generatePicklist(data)
            
        }
        

        else
        console.error('error in pick data',error)

    }
    generatePicklist(data){

        this.industryOptions= data.values.map(indsutryItem=>{
            return {
                label:indsutryItem.label,
                value:indsutryItem.value
            }
        })
        console.log('this.industryOptions'+this.industryOptions)
    }
    handleChange(event){
        const {name,value}=event.target

        if(name==='Industry'){
        this.selectedIndustry=value
        console.log('industry options are ',this.industryOptions)
        }
        if(name==='Source'){
            this.selectedSource=value
        }
        if(name==='Rating'){
            this.selectedRating=value
        }
        
    }

    //GetPicklist Values by record type

    @wire(getPicklistValuesByRecordType,{objectApiName:ACCOUNT,recordTypeId:'$accApiName.data.defaultRecordTypeId'})
    picklistValByRecType({data,error}){

        if(data){

            console.log('Acc objects picklist ',data)
            this.accSource=  this.getSoruceAndRatingVal(data.picklistFieldValues.AccountSource)
            this.accRating=  this.getSoruceAndRatingVal(data.picklistFieldValues.Rating)
            console.log('accSource', this.accSource)
            console.log('accSource', this.accRating)
        }
        else
        console.error('error getting picklist values of all objects', error)
    }

    getSoruceAndRatingVal(data){

        return data.values.map(source=>{
           return{ label:source.label,
            value:source.value
           }
        })
        
    }
   
}