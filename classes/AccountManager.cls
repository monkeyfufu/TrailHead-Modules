@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    @HttpGet
    global static Account getAccount(){
        Restrequest req = RestContext.request;
        String AccID = req.requestURI.substringBetween('Accounts/','/contacts');
        
        Account objAcc = [SELECT Id,Name, (SELECT Id,Name FROM Contacts) FROM Account WHERE id =: AccID ];      
        
        return objAcc;
    } 
	
}