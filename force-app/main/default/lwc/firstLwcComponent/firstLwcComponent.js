import { LightningElement,track } from 'lwc';

export default class FirstLwcComponent extends LightningElement {

        lwcSfProp='I am a JS property'
        updatedUserName=''
        passInput
@track obj={Name:"Puneet",
            age:29}

 //This gets called after the constructor, and after the elements are loaded in DOM
connectedCallback(){
this.getName() 
this.getNameNew()
}
//One way to define a function
getName(){
console.log('I am a method')
}
//Another way to define a function
getNameNew=()=>{
console.log('I am a new JS method')
}

handleUserName=(event)=>{
    this.updatedUserName=event.target.value
    //var uservar=event.target.value // this wont work
}
//check Password
handlePassword(){
    alert('called')
    this.passInput=this.template.getElementById('passwordInput')
    alert('not a error here ')
        console.log('passInput'+this.passInput)
}

// Using track property
 handleAge(event){
this.obj.age=Number(event.target.value)
//console.log('type of event.target.value'+typeof(event.target.value))
//alternative of track in JS
//this.obj={...this.obj,"age":event.target.value}
}



//Getter methods:
get billionAge(){
    let updatedAge=this.obj.age +1
    return updatedAge;
}

//conditional rendering getter
get stringCorrect(){
    return this.passInput==='Lionmessi1!!'
}

}