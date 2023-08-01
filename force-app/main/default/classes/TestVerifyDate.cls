@isTest
public class TestVerifyDate {

    @isTest	static void testCheckDates(){
        
        Date date1 = Date.newInstance(2020,05,01);
        Date date2 = Date.newInstance(2020,05,21);
        Date date3 = Date.newInstance(2020,06,21);
          
        Date chckD = VerifyDate.CheckDates(date1,date2);      
        	  
        System.assertEquals(date2, chckD);
    }
        
        
    @isTest static void testCheckDates1() {
            
            Date date1 = Date.newInstance(2020,05,01);
        	Date date2 = Date.newInstance(2020,06,21);
        	Date lastdate = Date.newInstance(2020,05,31);
        
        Date chckD =  VerifyDate.CheckDates(date1,date2);
        {
        	System.assertEquals(lastdate, chckD);
        }
        
        
    }
}