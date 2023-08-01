@isTest
global class ParkServiceMock implements WebServiceMock {
    
   
     global  void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) 
    {
        ParkService.byCountryResponse response_x=new ParkService.byCountryResponse();
        String[] FakeParkName=new String[]{'Anamudi Shola'};
        response_x.return_x=FakeParkName;
        system.debug('response_x.return_x value is'+response_x.return_x);
        response.put('response_x', response_x);
    }
}