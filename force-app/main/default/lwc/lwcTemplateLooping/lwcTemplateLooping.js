import { LightningElement } from 'lwc';

export default class LwcTemplateLooping extends LightningElement {

    interviewObjArr=[
        {   
            interviewNumber:1,
            companyName:'CapGemini',
            pannelName:'Prashant',
            result:'Awaiting',
        },
        {
            interviewNumber:2,
            companyName:'Fujitsu',
            pannelName:'TBC',
            result:'Awaiting Interview'
        }
    ]
}