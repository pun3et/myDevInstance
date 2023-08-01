import { LightningElement,wire } from 'lwc';
import sampleMsgChannel from '@salesforce/messageChannel/anyMessageChannelName__c'
import {MessageContext,publish} from 'lightning/messageService'
export default class LmsCmpB extends LightningElement {

    @wire(MessageContext)
    context
    
    messageData

    handleChange(event){
        const {value,name}=event.target
        this.messageData=value

    }
    handleClick(event){
        const passedMsg={
            lmsData:{
                value:this.messageData
            }
        }
        publish(this.context,sampleMsgChannel,passedMsg)
    }

    

}