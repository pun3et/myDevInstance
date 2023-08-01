@isTest
private class ParkLocatorTest {
    @isTest static void testCallout(){
        
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String[] ParkNames=ParkLocator.Country('India');
        String[] ReturnedParknames=new list<String>();
        ReturnedParknames.add('Anamudi Shola');
            
        System.assertEquals(ReturnedParknames, ParkNames);
    }
}