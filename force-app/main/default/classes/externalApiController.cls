public with sharing class externalApiController {
    @AuraEnabled
    public static string getCustomers(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:api');
        req.setMethod('GET');
        HttpResponse resp = http.send(req);
        return resp.getBody();
    }
}
