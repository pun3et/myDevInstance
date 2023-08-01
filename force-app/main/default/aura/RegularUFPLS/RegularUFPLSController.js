({
	myAction : function(component, event, helper) {
		
	},
    
    confirm:function(component,event,helper){
    
		  let activeSections = component.get("v.activeSections")
         //var name= activeSections.get("v.name");
          
			console.log(activeSections[0]); 
			       
           component.set("v.activeSections[0]",[]);
        
},
    showModal:function(component,event,helper)
    {
        var modalId=component.find("modalDiv")
        $A.util.removeClass(modalId, 'HideModal'); 
        
    },
    
    HideModal:function(component,event,helper){
        
        var modalId=component.find("modalDiv")
        $A.util.addClass(modalId, 'HideModal'); 
    },
    save:function(component,event,helper)
    {
    
    var validInvalidFields=component.find("Amountval")
    var invalid=0;
    if(validInvalidFields.length!=undefined)
    {
        var checkvalidity=validInvalidFields.reduce(function(validsSoFar,inputCmp){
            inputCmp.showHelpMessageIfInvalid()
            return validsSoFar && inputCmp.get('v.validity').valid;

        },true);
    }
    },
        Validate:function(component,event,helper){
            
            
            alert(JSON.stringify(component.get('v.FruitInfo.Name')));
        }
                                         
    
})