import { LightningElement,wire } from 'lwc';
import { getNavItems } from 'lightning/uiAppsApi' 
import { createRecord, updateRecord,deleteRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJ from '@salesforce/schema/Contact'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import { getListUi } from 'lightning/uiListApi';
const COLS=[{label:'id',fieldName:'Id'},
            {label:'Name',fieldName:'Name'},
            {label:'Email',fieldName:'Email',type:'email',editable:true},
            {label:'Phone',fieldName:'Phone',editable:true}
]
export default class NavItemsFetch extends LightningElement {
columns=COLS
navItemsData
formFieldsVal={}
contacts=[]
draftValues=[]
delRecId
    @wire(getNavItems,{navItemNames:'standard-account'})
    navItemsData({data,error}){
        if(data){
           console.log('the nav item is returning ',data)
           this.navItemsData=data.navItems
        }

    }
    changeHandler(event){
        
       const {name,value}= event.target
      
       this.formFieldsVal[name]=value
    }
    saveForm(){
        
        const recInput={apiName:CONTACT_OBJ.objectApiName,fields:this.formFieldsVal}
        createRecord(recInput).then(result=>{
            console.log('The record created is', result)
            this.showSuccessErrorMethod('YaY! Record created',`The record Id is ${result.id}`)
            this.template.querySelector('.createForm').reset()
            this.formFieldsVal={}
        }).catch(error=>{
            console.error('error occured'+error.body.message)
            this.showSuccessErrorMethod('Error',error.body.message,'error')
        })
    }
    showSuccessErrorMethod(title,message,variant){
        const toastedMesg= new ShowToastEvent({
            title,
            message,
            variant:variant || 'Success'
        })
        this.dispatchEvent(toastedMesg)

    }

    @wire(getListUi,{objectApiName:CONTACT_OBJ,listViewApiName:'AllContacts'})
    listViewHandler({data,error}){
        if(data){
            console.log('data returned is',data)
            this.contacts=data.records.records.map(item=>{
                return{
                    'Id':this.getValue(item,'Id'),
                    'Name':item.fields.Name.value,
                    'Email':item.fields['Email'].value,
                    'Phone':this.getValue(item,'Phone'),
                    'Title':this.getValue(item,'Title'),
                    'Account':item.fields.Account.id
                }   
            })
            console.log('contact data',this.contacts)
        }
        else
        console.error('Error returned is',error)
    }

    getValue(data,field){
      return  data.fields[field].value
    }

handleSave(event){
    console.log('draft values', JSON.stringify(event.detail.draftValues))
    const editedValues=event.detail.draftValues.map(draft=>
        {   
            const fields={...draft}
            return{
                fields:fields
            }
        })

        console.log('editedValues',editedValues)

        const promises= editedValues.map(editedValue=> updateRecord(editedValue))
        console.log('this is how promises looks like',promises)
        Promise.all(promises).then(()=>{
            console.log('Contact updated successfully')
            this.draftValues={}
        }).catch(error=>{
            console.error('error updating the record',error)
        })
        console.log('promise returned is',promises)
       // Promise.all(promises).then(result=>{}).catch()

   
}

delHandler(event){
    const {value,name}=event.target
    this.delRecId=value
}
deleteRec(){
    deleteRecord(this.delRecId).then((result)=>{
        this.showSuccessErrorMethod('Record deleted!','You have successfully deleted the record!! check data table above to confirm the deletion!')
    }).catch(error=>{
        this.showSuccessErrorMethod('Error deleting the record',`You have encountered this error ${error} while deleting the record`,'ERROR')
    })
}
}