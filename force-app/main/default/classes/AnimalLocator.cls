public class AnimalLocator {
    
    public static String getAnimalNameById(Integer PassId){
        
        Http http= new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+PassId);
        request.setMethod('GET');
        HttpResponse response= new HttpResponse();
        response=http.send(request);
        String AnimalName;
        
        if(response.getStatusCode()==200){
            
            Map<String,Object> results =new Map<String,Object>();
            results=(Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results.keySet());
            System.debug('Animal characterstics are'+results);
            Map<String,Object> Animals=(Map<String,Object>) results.get('animal');
            AnimalName=(String) Animals.get('name');
            
        }
        
        return AnimalName;
    }
    
}