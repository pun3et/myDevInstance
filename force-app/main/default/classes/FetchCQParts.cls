public class FetchCQParts implements Queueable,Database.AllowsCallouts {
    
    public void execute(QueueableContext qc){
        HTTPResponse res = CqDataCallout.getPartsRecords(); 
        ProcessPartsData.processRecords(res);
//        system.debug('parsedData'+parsedData);
  //      syncPartsDataFromResp(parsedData);
    }
    
    /*public static void syncPartsDataFromResp(List<JSON2Apex> partData){
         List<SQX_Part__c> partRecordData=new List<SQX_Part__c>();
        
        List<Account> accountsList=[select id,Name from account where Name ='High Volume' OR Name='Low Volume'];
        Map<String,ID> accsIdMap=new Map<String,ID>();
        For(Account acc:accountsList){
            
            accsIdMap.put(acc.Name,acc.Id);
            
        }
        for(JSON2Apex data:partData){
            SQX_Part__c objRec=new SQX_Part__c();
            
            objRec.Part_Name__c=data.Part_Name;        
            objRec.Part_Number__c=data.x_id;  
            objRec.Related_Account__c=setAccountBasedOnTotAmt(data.Total_Quantity_Shipped,accsIdMap);
            system.debug('objRec.Related_Account__c'+objRec.Related_Account__c);
            partRecordData.add(objRec);
        }
        upsert partRecordData Part_Number__c;
        system.debug('partRecordData'+partRecordData);
    }
    
    public static Id setAccountBasedOnTotAmt(Integer quant,Map<String,Id> accMap){
        
        if(quant>99)
            return accMap.get('High Volume');
            else
            return accMap.get('Low Volume');
            
            }
    
    public class cqDataWrapper {

	public String x_id {get;set;} // in json: _id
	public String PartName {get;set;} 
	public Integer TotalQuantityShipped {get;set;} 

   
    }
*/

}