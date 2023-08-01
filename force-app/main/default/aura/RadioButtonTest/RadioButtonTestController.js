({
	/* navigateToMyComponent : function(component, event, helper) {
    var nagigateLightning = component.find('navigate');
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: 'MyAccounts'
            } 
        };
        nagigateLightning.navigate(pageReference); 
}, */
    gotoURL : function(component,event,helper){
        console.log('Enter Here');
        var evt = $A.get("e.force:navigateToComponent");
        console.log('evt'+evt);
        evt.setParams({
            componentDef: "c:TestAuraif",
            //componentAttributes :{ //your attribute}
        });
       
    evt.fire();
    }
})