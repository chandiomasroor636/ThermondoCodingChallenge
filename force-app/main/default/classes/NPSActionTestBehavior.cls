@isTest
private class NPSActionTestBehavior {
    @isTest
    static void testSendNPS() {
        
        Test.startTest();
        NPSAction.sendNPS(5); 
        Test.stopTest();

    
        Test.startTest();
        NPSAction.sendNPS(-1); 
        Test.stopTest();

    
    }
}
