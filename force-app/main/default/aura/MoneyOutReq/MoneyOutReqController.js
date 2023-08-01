({
    doinit : function(component,event,helper){
        var action= component.get('c.getassetid');
        action.setParams({
            AssetID:component.get('v.recordId')
            
        });
        action.setCallback(this,function(response){
               var responseValue=response.getReturnValue();
        	   component.set('v.AmountBalance',responseValue);
                           });
        $A.enqueueAction(action,false); 
        
    },
    YesInput :function(component,event,helper){
       // var sectionAuraId = event.target.getAttribute("data-auraId");
        //  var checkoutput=component.set('v.UserChoice',"True");
        var Findsec1 = component.find("sec1");
        var Findsec2 = component.find("sec2");
        var confirmselection1= $A.util.hasClass(component.find("sec1"),"slds-show");
        var confirmselection2= $A.util.hasClass(component.find("sec2"),"slds-hide");
        
        if(confirmselection2==true){
            if(confirmselection1==true){
                $A.util.removeClass(Findsec1,"slds-show");
                $A.util.addClass(Findsec1,"slds-hide");
            }
            $A.util.removeClass(Findsec2,"slds-hide");
            $A.util.addClass(Findsec2,"slds-show");
            }
    },
    
    Incomedrawdown :function(component,event,helper){
     var value= component.get("v.drawdownval1");
     var incomeyes = component.find("incomeyes");
     var incomeno = component.find("incomeno");
     var confirmincomeyes= $A.util.hasClass(component.find("incomeyes"),"slds-show");
     var confirmincomeno= $A.util.hasClass(component.find("incomeno"),"slds-show");
        
        if(value=='yes'){
            if(confirmincomeno==true){
                 $A.util.removeClass(incomeno,"slds-show");
                $A.util.addClass(incomeno,"slds-hide");
            }
            $A.util.removeClass(incomeyes,"slds-hide");
            $A.util.addClass(incomeyes,"slds-show");
        }
            else if(value=='no')
            {
                if(confirmincomeno==false){
                $A.util.removeClass(incomeyes,"slds-show");
                $A.util.addClass(incomeyes,"slds-hide");
            }
              $A.util.removeClass(incomeno,"slds-hide");
            $A.util.addClass(incomeno,"slds-show");
            }
            
        
        
    },
    
    NoInput :function(component,event,helper){
       // alert("youve clicked no");
       /* var checkoutput1=component.set('v.UserChoice2',"True");
        var checkoutput2=component.set('v.UserChoice',"False"); */
        var Findsec1 = component.find("sec1");
        var Findsec2 = component.find("sec2");
        var confirmselection1= $A.util.hasClass(component.find("sec1"),"slds-hide");
        var confirmselection2= $A.util.hasClass(component.find("sec2"),"slds-show");
        
        if(confirmselection1==true){
            if(confirmselection2==true){
                $A.util.removeClass(Findsec2,"slds-show");
                $A.util.addClass(Findsec2,"slds-hide");
            }
            $A.util.removeClass(Findsec1,"slds-hide");
            $A.util.addClass(Findsec1,"slds-show");
            }
            
        
        
    },
    
	toggleSection : function(component, event, helper) {
        // dynamically get aura:id name from 'data-auraId' attribute
        var sectionAuraId = event.target.getAttribute("data-auraId");
        // get section Div element using aura:id
        var sectionDiv = component.find(sectionAuraId).getElement();
        /* The search() method searches for 'slds-is-open' class, and returns the position of the match.
         * This method returns -1 if no match is found.
        */
        var sectionState = sectionDiv.getAttribute('class').search('slds-is-open'); 
        
        // -1 if 'slds-is-open' class is missing...then set 'slds-is-open' class else set slds-is-close class to element
        if(sectionState == -1){
            sectionDiv.setAttribute('class' , 'slds-section slds-is-open');
        }else{
            sectionDiv.setAttribute('class' , 'slds-section slds-is-close');
        }
    },
    
    getIncomeSelection:function(component,event,helper){
        var opts = document.querySelector('input[name="incomeSelection"]:checked').value;
        alert(opts);
    },
    
    /*handleChange: function (cmp, event, helper) {
        // This will contain the string of the "value" attribute of the selected option
        var selectedOptionValue = event.getParam("value");
        //alert("Option selected with value: '" + selectedOptionValue + "'");
    }, */
    
    loadOptions: function (component, event, helper) {
        var options = [
            {'label': 'Monthly', 'value': 'monthly'},
    		{'label': 'Quaterly', 'value': 'quaterly'},
            {'label': 'Half Yearly', 'value': 'halfyearly'},
            {'label': 'Yearly', 'value': 'yearly'}
        ];
        component.set("v.statusOptions", options);
    },

    handleOptionSelected: function (component, event) {
        var selectedOptionValue = event.getParam("value");
        console.log(selectedOptionValue);
    },
    
    
    checkValidity : function(component, event, helper) {
},
    //Taxable income-Single disproportionate values
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Asset Name', fieldName: 'Id', type: 'text' , editable: false},
            {label: 'Disinvestment Allocation', fieldName: 'Name', type: 'text' ,editable: true},
        ]);
        //helper.fetchData(cmp,event, helper);
    },
    handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        console.log(draftValues);
        var action = cmp.get("c.updateAccount");
        action.setParams({"acc" : draftValues});
        action.setCallback(this, function(response) {
            var state = response.getState();
            $A.get('e.force:refreshView').fire();
            
        });
        $A.enqueueAction(action);
        
    },
            
            AdvisorChargePage:function(component,event,helper){
             var evt = $A.get("e.force:navigateToComponent");
       		 console.log('evt'+evt);
       		 evt.setParams({
             componentDef: "c:Navigatepage",
            //componentAttributes :{ //your attribute}
        });
       
    evt.fire();
            
            },
            
            
    TaxCalc : function(component, event, helper) {
	var a = component.get("v.num1");
    var percent=parseInt(a) * 0.25 ; 
    var Taxable= a - percent;
        component.set("v.percent",percent);
        component.set("v.Taxable",Taxable);
        
}

})