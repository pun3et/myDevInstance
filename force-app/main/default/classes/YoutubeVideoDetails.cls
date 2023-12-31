// Generated by JSON2Apex http://json2apex.herokuapp.com/
global class YoutubeVideoDetails {
    
    webservice static void details(String videoId,String recId)
    {
        String apiKey=Youtube_API_settings__c.getInstance('Youtube API Key').value__c;
        String endPoint=Youtube_API_settings__c.getInstance('Youtube Endpoint').value__c;
        endPoint=endPoint.replace('{API_KEY}', apiKey);
        endPoint=endPoint.replace('{VIDEO_ID}', videoId);
        HttpResponse httpRes=new HttpResponse();
        HttpRequest httpReq=new HttpRequest();
        Http http=new HTTP();
        httpReq.setMethod('GET');
        httpReq.setEndpoint(endPoint);
        httpRes=http.send(httpReq);
        
        JsonParser jp=(JsonParser)JSON.deserialize(httpRes.getBody(),JsonParser.Class );
        
        Youtube_Details__c ytDet=new Youtube_Details__c();
        ytDet.id=recId;
        ytDet.No_of_view_count__c=jp.items[0].Statistics.viewCount;
        ytDet.No_of_likes__c=jp.items[0].Statistics.likeCount;

    }
    public class JsonParser {
        public String kind;
        public String etag;
        public List<Items> items;
        public PageInfo pageInfo;
    }
    
    public class PageInfo {
        public Integer totalResults;
        public Integer resultsPerPage;
    }
    
    public class Items {
        public String kind;
        public String etag;
        public String id;
        public Statistics statistics;
    }
    
    public class Statistics {
        public String viewCount;
        public String likeCount;
        public String favoriteCount;
        public String commentCount;
    }
  
}