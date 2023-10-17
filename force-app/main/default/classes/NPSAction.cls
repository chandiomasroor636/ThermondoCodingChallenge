public with sharing class NPSAction {
    @InvocableMethod(label='Send NPS Survey' description='Sends data to the NPS API')
    public static List<Id> sendNPS(List<Id> orderRecordIds) {
        List<Id> fulfilledOrderIds = new List<Id>();

        // Query Order records, get email addresses, and send data to the NPS API
        for (Id orderId : orderRecordIds) {
            Order order = [SELECT Id, OrderNumber, BillToContactId, Status FROM Order WHERE Id = :orderId];
            
            if (order.Status == 'Fulfilled') {
                Contact billToContact = [SELECT Email FROM Contact WHERE Id = :order.BillToContactId];
                
                if (billToContact.Email != null) {
                    String email = billToContact.Email;
                    String orderNumber = order.OrderNumber;
                    
                    // Prepare data and make an HTTP callout
                    Boolean success = sendNPSSurvey(email, orderNumber);
                    
                    if (success) {
                        fulfilledOrderIds.add(orderId);
                    }
                }
            }
        }

        return fulfilledOrderIds;
    }

    public static Boolean sendNPSSurvey(String email, String orderNumber) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://salesforce-coding-challenge.herokuapp.com');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf('tmondo:Noy84LRpYvMZuETB')));
        req.setHeader('Content-Type', 'application/json');
        
        
        String requestBody = '{"email": "' + email + '", "orderNumber": "' + orderNumber + '"}';
        req.setBody(requestBody);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            
            return true;
        } else {
            
            return false;
        }
    }
}
