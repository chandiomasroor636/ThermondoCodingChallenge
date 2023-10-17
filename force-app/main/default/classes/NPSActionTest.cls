@isTest
private class NPSActionTest {
    @isTest
    static void testSendNPS() {
        
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', Email = 'test@example.com', AccountId = testAccount.Id);
        insert testContact;
        
        Order testOrder1 = new Order(OrderNumber = '123', Status = 'Fulfilled', BillToContactId = testContact.Id);
        Order testOrder2 = new Order(OrderNumber = '456', Status = 'Draft', BillToContactId = testContact.Id);
        insert new List<Order>{testOrder1, testOrder2};
        
        List<Id> orderRecordIds = new List<Id>{testOrder1.Id, testOrder2.Id};
        
       
        Test.startTest();
        List<Id> fulfilledOrderIds = NPSAction.sendNPS(orderRecordIds);
        Test.stopTest();

       
        System.assertEquals(1, fulfilledOrderIds.size(), 'Only one order should be fulfilled');
        
     
        Order updatedTestOrder2 = [SELECT Status FROM Order WHERE Id = :testOrder2.Id];
        System.assertEquals('Draft', updatedTestOrder2.Status, 'Order status should remain Draft');
        
        
        Order updatedTestOrder1 = [SELECT Status FROM Order WHERE Id = :testOrder1.Id];
        System.assertEquals('Fulfilled', updatedTestOrder1.Status, 'Order status should remain Fulfilled');
    }

    @isTest
    static void testSendNPSSurvey() {
        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        Boolean result = NPSAction.sendNPSSurvey('test@example.com', '123');

        
        System.assertEquals(true, result, 'sendNPSSurvey should return true for a successful callout');
    }
}
