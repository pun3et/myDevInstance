({
    
        toggle : function(component, event, helper) {
        var toggleText = component.find("text");
            console.log(toggleText);
            var testtext="abc";
            console.log(testtext);
        $A.util.toggleClass(toggleText, 'slds-hide');
    }
    
		
	})