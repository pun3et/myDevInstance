@isTest
private class LeadProcessorTest {
    
    @isTest
    private static void testBatchClass(){
        List<Lead> leadList=new list<Lead>();
        
        for(integer i=0;i<200;i++){
            
            leadList.add(new Lead(LastName='Sport'+i,Company='Liverpool'));
        }
        insert leadList;
        Test.startTest();
        LeadProcessor lp=new LeadProcessor();
        Id Dbld=Database.executeBatch(lp,200);
        Test.stopTest();
        
        List<Lead> updatedSourceLead=[select id,LeadSource from lead where LeadSource='Dreamforce'];
        system.assertEquals(200,updatedSourceLead.size());

        
        
    }

}