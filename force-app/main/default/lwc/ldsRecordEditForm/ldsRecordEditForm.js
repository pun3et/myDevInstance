import { LightningElement ,api} from 'lwc';
import ACCOUNT_ID from '@salesforce/schema/Contact.AccountId'
import BIRTHDATE from '@salesforce/schema/Contact.Birthdate'
import EMAIL_ID from '@salesforce/schema/Contact.Email'
import CONTACT_NAME from '@salesforce/schema/Contact.Name'
import CONTACT from '@salesforce/schema/Contact'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
//ields=[ACCOUNT_ID,BIRTHDATE,EMAIL_ID]
export default class LdsRecordEditForm extends LightningElement {
    fieldsArr=[ACCOUNT_ID,BIRTHDATE,EMAIL_ID]
    fields={
        accId:ACCOUNT_ID,
        bDate:BIRTHDATE,
        emailId:EMAIL_ID,
        conName:CONTACT_NAME
    }
    objName=CONTACT

    handleSuccess(event){
        alert('inside handle Success')
        const toastMsgEvent= new ShowToastEvent({
            title:'My first record form',
            message:`record created and Id is ${event.detail.id}`,
            variant:'success',
            mode:'dismissable'
        })
        this.dispatchEvent(toastMsgEvent)
    }

    handleCancel(){
        var nodeList=this.template.querySelectorAll('lightning-input-field')
        console.log('nodeList'+nodeList)
            if(nodeList){
        Array.from(nodeList).forEach(field=>{
            field.reset()
        })
    }

    }
        handleSubmit(event){
            event.preventDefault()

            const emailField=this.template.querySelector('.email')
            console.log('emailField.value'+emailField.value)

            if(!emailField.value.includes('puneet')){
                console.log('inside If')
                emailField.setCustomValidity('You are not puneet')

            }
            else{
                console.log('inside else')
                emailField.setCustomValidity('')

            }
            emailField.reportValidity()

        }
    // handleSubmit(event){
    //     event.preventDefault()
    //     const inputFields=this.template.querySelectorAll('lightning-input-field')
    //  console.log('inputFields'+inputFields)
    //     Array.from(inputFields).forEach(field=>{
    //         console.log('fields stringified'+JSON.stringify(field.value))
    //         if(field.value.FirstName){
    //             console.log('field.value.FirstName'+field.value.FirstName)
    //             if(!field.value.FirstName.includes('Puneet')){
    //                 console.log('inside IF ')
    //                 field.setCustomValidity('You are not Puneet')
    //             }
    //             else{
    //                 console.log('inside Else')
    //                 field.setCustomValidity('Esle')

    //             }
    //             field.reportValidity()
    //        /* if(!field.FirstName.value.includes('Puneet')){

    //            // field
    //         } */
    //     }
    //     })

    // }

}