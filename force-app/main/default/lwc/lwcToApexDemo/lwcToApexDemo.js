import { LightningElement,wire } from 'lwc';
import getAccList from '@salesforce/apex/AccountLwcClass.getAccList'
import getHighRevAccs from '@salesforce/apex/AccountLwcClass.highRevenueAccount'
import getSearchedAccs from '@salesforce/apex/AccountLwcClass.searchedAccounts'
export default class LwcToApexDemo extends LightningElement {

listAccsViaFn
annRev=100000 
imperativeAccountList
searchKey=''
searchedAccounts
timer
@wire(getAccList)
getAccounts({data,error}){

    if(data){
    console.log('the data returned is ',data)
    this.listAccsViaFn=data.map(item=>{
        let newType=item.Type==='Customer - Channel'?'Customer':item.Type==='Customer - Direct'?'Direct':'--------'
        let returnItem={...item,newType}
        return returnItem

    })
    }
    else
    console.error(`Faced this error ${error} while returning accounts`)

    console.log('this.listAccsViaFn',this.listAccsViaFn)
}

selectedRevenue(event){
    const {value,name,label}=event.target
    this.annRev=event.detail.value
    console.log('label value')
   // console.log('label is ',event.target.options.label)
    

}
get revenueOptions(){
    return [
        {label:'Greater than 100000',value:100000},
        {label:'Greater than 1000000',value:1000000},
        {label:'Greater than 10000000',value:10000000},
        {label:'Greater than 100000000',value:100000000},
        {label:'Greater than 1000000000',value:1000000000},
    ]
}
@wire(getAccList)
listAccs
 
@wire(getHighRevAccs,{annRev:'$annRev'})
bigRevAccs

//calling imperetively
getHighRevAccs(){
    getAccList().then((result =>{
        this.imperativeAccountList=result
        console.log('result returned is',result)
    })).catch((error=>{

        console.error('error is ',error)
    }))
}
searchAccs(event){
    window.clearTimeout(this.timer)
    this.searchKey=event.target.value
    this.timer=window.setTimeout(()=>{
        this.apexCallMethod()
    },2000)
   

}
apexCallMethod(){
    getSearchedAccs({accountName: this.searchKey}).then((result=>{
        this.searchedAccounts=result
        console.log('result of acc searched',result)

    })).catch((error=>{
        console.error('Account search returned an error',error)
    }))
}

}