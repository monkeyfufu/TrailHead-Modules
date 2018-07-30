@isTest 
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> lstAccount = new list<Account>();
        for(Integer i=0;i<100; i++){
            Account objAcc = new Account(Name = 'Test Acc'+i);
            if(i<50){
                objAcc.BillingState = 'NY';
            }else{
                objAcc.BillingState = 'CA';
            }
            lstAccount.add(objAcc);
        }
        INSERT lstAccount;
    }
    static testmethod void testClassAddPrimaryCon(){
        
        Contact objCon = new Contact(LastName = 'Test Contact');
        //INSERT objCon;
        AddPrimaryContact objClss = new AddPrimaryContact(objCon,'CA');
        Test.startTest();
        System.enqueueJob(objClss);
        Test.stopTest();
        System.assertEquals(50, [select count() from Contact]);
    }
}