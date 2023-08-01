({
    ClickRadio : function(component,event,helper){
        var act = event.getSource().get("v.name");	
        var val = event.getSource().get("v.radioValue");
        var val1= component.find("phasedopts1");
        var val2= val1.get("v.value");
        console.log('the name of clicked comp is'+act)
        
     //var val=component.get("v.value");
        console.log('the value of clicked comp is'+val2)
        if(act=='phasedropdowngrp' && val1=='yes' ){
            
            component.set("v.radioValueFromController.key1",val)
            console.log(radioValueFromController.key1)
        }
     
        
       
    },
    
    getValueFromApplicationEvent : function(component,event,helper){
         var ShowResultValue = event.getParam("Pass_Result");
        // set the handler attributes based on event data
        component.set("v.Get_Result", ShowResultValue);
        alert("value of get result is"+ ShowResultValue);
        
    }

})