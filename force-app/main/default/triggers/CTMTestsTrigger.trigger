trigger CTMTestsTrigger on GAM_Contact_Team_Member__c (Before insert, before update) {

     if (Trigger.isUpdate && Trigger.isBefore) {
  
          List<GAM_Contact_Team_Member__c> ExistingCTMs=[select id,GAM_User__r.Name,GAM_Contact__c,GAM_MarketingOwnerInfracapital__c,GAM_MarketingOwnerInstitutional__c,GAM_MarketingOwnerWholesale__c from GAM_Contact_Team_Member__c where id !=:Trigger.new[0].id AND GAM_Contact__c=:Trigger.new[0].GAM_Contact__c ];
          
         for (GAM_Contact_Team_Member__c NewCTM:Trigger.new){

            if(Schema.sObjectType.GAM_Contact_Team_Member__c.fields.GAM_MarketingOwnerWholesale__c.isAccessible() && Schema.sObjectType.GAM_Contact_Team_Member__c.fields.GAM_MarketingOwnerInfracapital__c.isAccessible() && Schema.sObjectType.GAM_Contact_Team_Member__c.fields.GAM_MarketingOwnerInstitutional__c.isAccessible()){
                if(NewCTM.GAM_MarketingOwnerWholesale__c==true || NewCTM.GAM_MarketingOwnerInfracapital__c==true || NewCTM.GAM_MarketingOwnerInstitutional__c==true){

                    for(GAM_Contact_Team_Member__c checkExistingCTM:ExistingCTMs){

                        if(NewCTM.GAM_MarketingOwnerWholesale__c==true && checkExistingCTM.GAM_MarketingOwnerWholesale__c==true){

                            NewCTM.addError('Marketing Owner Wholesale is already assigned to Contact Team Member ' +checkExistingCTM.GAM_User__r.Name +'. If you wish to change this, please edit Contact Team Member '+ checkExistingCTM.GAM_User__r.Name + ' record');
                        }

                        else if(NewCTM.GAM_MarketingOwnerInstitutional__c==true && checkExistingCTM.GAM_MarketingOwnerInstitutional__c==true){

                            NewCTM.addError('Marketing Owner Institutional is already assigned to Contact Team Member ' +checkExistingCTM.GAM_User__r.Name +'. If you wish to change this, please edit Contact Team Member '+ checkExistingCTM.GAM_User__r.Name + ' record');
                        }

                        else if(NewCTM.GAM_MarketingOwnerInfracapital__c==true && checkExistingCTM.GAM_MarketingOwnerInfracapital__c==true){

                            NewCTM.addError('Marketing Owner Infracapital is already assigned to Contact Team Member ' +checkExistingCTM.GAM_User__r.Name +'. If you wish to change this, please edit Contact Team Member '+ checkExistingCTM.GAM_User__r.Name + ' record');
                        }
                    }

                }
            }
        }
      
      
      }
}