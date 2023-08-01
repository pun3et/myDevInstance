public with sharing class AnimalsServiceHandler {
    
    @AuraEnabled
    public static String fetchAnimals(){
        string resp = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Provide the Named Credentials
        request.setEndpoint('callout:Creds');
        request.setMethod('GET');        
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            resp= response.getBody();
        }
       return resp;
    }
}