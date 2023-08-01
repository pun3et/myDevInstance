({
    
    doinit : function(component,event,helper){
        var CaseIdFromVf=component.get("v.CaseIDFromVfPage");
        alert("Record ID is"+CaseIdFromVf);
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
    
     Incomedrawdown1 :function(component,event,helper){
     var value= component.get("v.drawdownval2");
     var incomeyes = component.find("incomeyes1");
     var incomeno = component.find("incomeno1");
     var confirmincomeyes= $A.util.hasClass(component.find("incomeyes1"),"slds-show");
     var confirmincomeno= $A.util.hasClass(component.find("incomeno1"),"slds-show");
     //   alert(confirmincomeyes);
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
    
    percentvalidation : function(component, event,helper) {
        
        var inputCmp = component.get("v.drawdownPercent");
       // var value = inputCmp.get("v.drawdownPercent");
        alert("value is"+inputCmp);
        // is input valid text?
        if (inputCmp > 25) {
            inputCmp.setCustomValidity("Percentage cannot be greater than 25%");
        }
        // Tells lightning:input to show the error right away without needing interaction
    },
    
    Drawdownopt1 :function(component,event,helper){
        
        var value= component.get("v.drawdownval");
     var secno = component.find("sec1");
     var secyes = component.find("sec2");
     var confirmsecno= $A.util.hasClass(component.find("sec1"),"slds-show");
     var confirmsecyes= $A.util.hasClass(component.find("sec2"),"slds-show");
        
        if(value=='yes'){
            if(confirmsecno==true){
                 $A.util.removeClass(secno,"slds-show");
                $A.util.addClass(secno,"slds-hide");
            }
            $A.util.removeClass(secyes,"slds-hide");
            $A.util.addClass(secyes,"slds-show");
        }
            else if(value=='no')
            {
                if(confirmsecyes==true){
                $A.util.removeClass(secyes,"slds-show");
                $A.util.addClass(secyes,"slds-hide");
            }
              $A.util.removeClass(secno,"slds-hide");
            $A.util.addClass(secno,"slds-show");
            }
            
        
        
    },
    
    phaseddrawdown1 : function(component,event,helper){
        
      var value= component.get("v.phasedradioValue");  
       var phasedradioyes= component.find("phaseddrawdownYes");
        var phasedradiono= component.find("phaseddrawdownNo");
         var confirmsecyes= $A.util.hasClass(component.find("phaseddrawdownYes"),"slds-show");
    	  var confirmsecno= $A.util.hasClass(component.find("phaseddrawdownNo"),"slds-show");
        
        if(value=='yes'){
            
            if(confirmsecno==true){
                $A.util.removeClass(phasedradiono,"slds-show");
                $A.util.addClass(phasedradiono,"slds-hide");
                
            }
            
            $A.util.removeClass(phasedradioyes,"slds-hide");
            $A.util.addClass(phasedradioyes,"slds-show");
        }
        
        else if(value=='no'){
            
            if(confirmsecyes==true){
               
                $A.util.removeClass(phasedradioyes,"slds-show");
                $A.util.addClass(phasedradioyes,"slds-hide");
                
            }
            
            $A.util.removeClass(phasedradiono,"slds-hide");
            $A.util.addClass(phasedradiono,"slds-show");
        }
    },
    
    phaseddrawdown2 : function(component,event,helper){
        
        
    },
    
 /*   NoInput :function(component,event,helper){
       
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
        
    },
    
    NoInput :function(component,event,helper){
      
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
  						  */
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
    
    AdvisorChargePage:function(component,event,helper){
        debugger;
    	  
        var getAmt= component.find("DrawdownAmt1").get("v.value");
      //  alert("Amount value is "+ getAmt);
        component.set("v.ServIllustration",getAmt);
        component.set("v.NUM","TWO");
        
      //  var cmpEvent =event.getSource().get("v.name");
      
        var getcmpEvent = component.getEvent("MoneyOutEvent");
        
       // alert("name is"+cmpEvent);
      
       // if(cmpEvent==="next")
        
        getcmpEvent.setParams({
            "isAdviserCharge" : true,
            "isMoneyOut" : false,
            "isPropDisprop" : false,
        }); 
        
        
        getcmpEvent.fire();
        
        
        /*
        var getcmpEvent1 = component.getEvent("HandleMoneyOutEvent");
        var getDrawdownamt=component.get("v.ServIllustration.PRU_DrawdownAmount__c");
        var getDrawdownperc=component.get("v.ServIllustration.PRU_PercentageOfTaxFreeCashToBeTaken__c");
        
        getcmpEvent1.setParams({
            
            "Drawdownamt" : getDrawdownamt,
            "Drawdownperc" : getDrawdownperc,
        }); */
      
      //  fireComponentEvent();
        //component.set("v.isAdviser",true);
    
      
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
        
   		var recId=component.get("v.recordId");
        console.log(recId);
        //alert("RecordId is"+recId)
  
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
    TaxCalc : function(component, event, helper) {
	var a = component.get("v.num1");
    var percent=parseInt(a) * 0.25 ; 
    var Taxable= a - percent;
        component.set("v.percent",percent);
        component.set("v.Taxable",Taxable);
        
},
        handleCreateAccount : function(component, event, helper) {
        component.find("accForm").submit();
            console.log("Record was saved!");
    },
            doInit : function(component, event, helper) {
        	component.get("v.recordId");
    },
            submitDetails: function(component, event, helper) {
            console.log("button clicked");
            var tis= component.find("TaxableIncomeSingleSectionInput").get("v.taxableincomesingle");
            if(tis){
            console.log("data saved=",+tis);
            }
            
            },
            
            confirmDrawdown:function(component,event,helper){
            debugger;
            component.set("v.isDrawdownconfirmed",true);
            console.log('confirmDrawdown');
            },
            
            fireComponentEvent : function(component, event,helper) {
            alert("Inside comp event function");
        	/* var cmpEvent = component.getEvent("MoneyOutEvent");
        	cmpEvent.setParams({
            "message" : "A component event fired me. " +
            "It all happened so fast. Now, I'm here!" });
        	cmpEvent.fire(); */
    }
            

})