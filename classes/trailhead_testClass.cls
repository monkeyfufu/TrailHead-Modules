@isTest
public class trailhead_testClass {
    
    static testmethod void test(){
        List<Account> lstAcc = new list<Account>();
        for(integer i=0;i<10;i++){
            lstAcc.add(new Account(Name = 'Test Account'+i, Match_Billing_Address__c= TRUE, BillingPostalCode = '10001'));
        }
        INSERT lstAcc;
        // create Contact records
        list<Contact> lstContacts = RandomContactFactory.generateRandomContacts(10,'Test Contact');
        INSERT lstContacts;
        
        //CREATE OPPORTUNITY
        list<Opportunity> lstopp = new list<Opportunity>();
        for(integer i=0;i<10;i++){
            //objOpp.StageName == 'Closed Won'
            if(i>5){
                lstopp.add(new opportunity(StageName = 'Closed Won',Name = 'test'+i,CloseDate= Date.today()));
            }else{
                lstopp.add(new opportunity(StageName = 'Prospecting',Name = 'test'+i,CloseDate= Date.today()));
            }
        }
        INsert lstopp;
        list<Opportunity> lstOppToUp = new list<Opportunity>(); 
        for(Opportunity objOpp : lstopp){
            if(objOpp.StageName != 'Closed Won'){
                objOpp.StageName =  'Closed Won';
                lstOppToUp.add(objOpp);
            }
        }
        Update lstOppToUp;
    }
}