@IsTest
private class AccountManagerTest{
    @isTest static void testAccountManager(){
        Id recordId = getTestAccountId();
      
        RestRequest request = new RestRequest();
        request.requestUri ='https://na53.salesforce.com/services/apexrest/Accounts/'+ recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account  acc = AccountManager.getAccount();
       
    }
    
    private static Id getTestAccountId(){
        Account acc = new Account(Name = 'TestAcc2 Acc');
        Insert acc;
         
        Contact con = new Contact(LastName = 'TestCont2 Acc', AccountId = acc.Id);
        Insert con;
        
        return acc.Id;
    }
}