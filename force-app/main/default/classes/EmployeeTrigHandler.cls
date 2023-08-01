public class EmployeeTrigHandler {
    
    public void sambhaalteHai(List<employee__c> lstEmp,Map<id,employee__c> oldEmpRec){
        
        set<id> techFirmId=new set<id>();
        
        for(employee__c emp:lstEmp){
            if(oldEmpRec!=null){
                Decimal oldSal;
                employee__c empRec=new employee__c();
                oldSal=oldEmpRec.get(emp.id).Salary__c;
                if(emp.Salary__c!=oldSal){
                    techFirmId.add(emp.TechFirm__c);
                }
            }
            else{
                if(emp.TechFirm__c!=null)
                techFirmId.add(emp.TechFirm__c);   
            }
                
        }
        
        calculateMaxSalary(techFirmId);
        calculateMinSalary(techFirmId);
  
        
    }
    
    public void calculateMaxSalary(set<id> techFirmId){
        List<AggregateResult> maxSalAggr=[select TechFirm__c sethlog, Max(Salary__c) pagaar from employee__c where TechFirm__c IN :techFirmId group by TechFirm__c ];
        List<TechFirm__c> badeLogs=new List<techFirm__c>();
        for(AggregateResult maggr:maxSalAggr){
            
            TechFirm__c badaLog=new TechFirm__c();
            
            badaLog.id=(id)maggr.get('sethlog');
            badaLog.MaxSalary__c=(Decimal)maggr.get('pagaar');
            
            badeLogs.add(badaLog);
        }
        
        Database.update(badeLogs,false);
        
    }
    
     public void calculateMinSalary(set<id> techFirmId){
        List<AggregateResult> minSalAggr=[select TechFirm__c sethlog, Min(Salary__c) pagaar from employee__c where TechFirm__c IN :techFirmId group by TechFirm__c ];
        List<TechFirm__c> badeLogs=new List<techFirm__c>();
        for(AggregateResult maggr:minSalAggr){
            
            TechFirm__c badaLog=new TechFirm__c();
            
            badaLog.id=(id)maggr.get('sethlog');
            badaLog.MinSalary__c=(Decimal)maggr.get('pagaar');
            badeLogs.add(badaLog);
        }
         
         Database.update(badeLogs,false);
        
    }

}