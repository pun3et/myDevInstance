@isTest
global class CalculatorServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint, 
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        System.debug('Value of stub is'+stub);//Returns value of this keyword
        calculatorServices.doAddResponse response_x = 
            new calculatorServices.doAddResponse();
               
        response_x.return_x = 3.0;
        // end
        response.put('response_x', response_x); 
               System.debug('Value of response is'+response);
   }
}