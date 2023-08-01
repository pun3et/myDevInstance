({
    handleMsg : function(component, message) {
      
        if(message!=null && message.getParam("lmsData").value!=null)
        {
            
            component.set("v.messageReceived",message.getParam("lmsData").value)
        }
  
    },
    
    messageChange : function(component, event, helper) {
        
    },
    
    publishMessage : function(component, event, helper) {
        let msg= component.get('v.messValueAttr')
        let message={
            lmsData:{
                value:msg
            }
        }
        component.find('firstMsgChannel').publish(message)
    }
})