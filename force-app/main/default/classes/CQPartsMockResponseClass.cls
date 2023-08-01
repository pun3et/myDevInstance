/* Class to Generate Mock Response */
@isTest
global class CQPartsMockResponseClass implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {

        System.assertEquals('callout:Fetch_CQ_part_details', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
            String jsonInput='[{"_id": "619683d69402c24f000237e9","Part Name": "Population Sensor","Total Quantity Shipped": 350000},'+
                 '{"_id": "619643769402c24f000229ec","Part Name": "Drill Gauge","Total Quantity Shipped": 125000}]';
        
        res.setBody(jsonInput);
        
        res.setStatusCode(200);
        return res;
    }
}