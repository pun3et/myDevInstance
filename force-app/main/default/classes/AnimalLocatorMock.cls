@isTest

global class AnimalLocatorMock implements HttpCalloutMock {
    
  //Impliments this method
    global HTTPResponse respond(HTTPRequest request){
        
        HttpResponse response= new HttpResponse();
        // response.setHeader('Content');
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        response.setStatusCode(200);
        return response;
    }    
    
}