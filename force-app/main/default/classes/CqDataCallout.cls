public class CqDataCallout {

    public static HTTPResponse getPartsRecords(){
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Fetch_CQ_part_details');
        req.setMethod('GET');
        req.setHeader('Content-type', 'application/json');   
        req.setHeader('x-api-key', 'b96d75ce0f9f342d10af6710ef8ea7ed0ad06');   
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return res;
    }
}