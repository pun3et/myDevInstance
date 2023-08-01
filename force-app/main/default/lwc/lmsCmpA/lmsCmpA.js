import { LightningElement,wire } from 'lwc';
import messageChannelNameHere from '@salesforce/messageChannel/anyMessageChannelName__c'
import { APPLICATION_SCOPE, MessageContext,subscribe, unsubscribe } from 'lightning/messageService';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class LmsCmpA extends LightningElement {

    @wire(MessageContext)
    context

    subsMessageVal
    subscription
    
    connectedCallback(){
        this.getPublishedMessage()
    }
    getPublishedMessage(){
        this.subscription=subscribe(this.context,messageChannelNameHere,(message)=>{this.getMessageVal(message)})
        console.log('subs val',this.subscription)
    }

    getMessageVal(message){
        this.subsMessageVal=message.lmsData.value? message.lmsData.value:'No message received'
    }

    handleSub(){
    if(this.subscription){
        unsubscribe(this.subscription)
        this.subscription=null
        this.showToaster('Unsubscribed',
        'You have successfully unsubscribed!!',
        'SUCCESS',
        'dismissable')
    }
    else
        {
            this.subscription=subscribe(this.context,messageChannelNameHere,(message)=>{this.getMessageVal(message)},{scope:APPLICATION_SCOPE})
            this.showToaster('Subscribed',
            'You have successfully Subscribed!!',
            'SUCCESS',
            'dismissable')
           }
        
    }

    showToaster(title,msg,variant,mode){

        const subsOrUnsubsMsg= new ShowToastEvent({
            title:title,
            message:msg,
            variant: variant==='SUCCESS'? variant:'ERROR',
            mode:mode
        })
        this.dispatchEvent(subsOrUnsubsMsg)
    }
}