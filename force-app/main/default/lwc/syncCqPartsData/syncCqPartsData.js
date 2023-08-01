import { LightningElement,wire,track } from 'lwc';
import fetchCQParts from '@salesforce/apex/InvokePartsFetch.fetchCqPartsData'
import getJobStatus from '@salesforce/apex/InvokePartsFetch.getJobStatus'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import { refreshApex } from '@salesforce/apex';
export default class SyncCqPartsData extends LightningElement {

processId
@track jobStatus

    fetchData(event){

        fetchCQParts().then((result=>{
            this.processId=result
            this.toastedMessage('Syncronization performed','Sync request successfully sent','SUCCESS')
            console.log('processId+',result)
        })).catch((error=>{
            this.toastedMessage('Error Sending sync Request',error,'ERROR')
                console.log('you have got an error'+error)
        }))
  }
    
testMethodInt(){
  
    refreshApex(this.jobStatus)

}

@wire(getJobStatus,{recId:'$processId'})
recidData(result){
    if(result){
        this.jobStatus=result
       
        if(this.jobStatus.data!='Completed'){
       
            this.testMethodInt()
        } 
    }
    else
    console.log('there is an error',result.error)
}

    toastedMessage(title,msg,vnt){

        const custToast=new ShowToastEvent({
            title:title,
            message:msg,
            variant:vnt,
            mode:'dismissable'
        })

        this.dispatchEvent(custToast)
    }

    

}