@isTest
public class LeadProcessorTest {
    public static list<Lead> lstLead;
    @testSetup  static void setup(){
        lstLead = new list<lead>();
        for(integer i=0; i<200;i++){
            lead objlead = new lead();
            objlead.Company = 'Mike-'+i;
            objlead.LastName = 'Mike'+i;
            objlead.Status = 'Open';
            lstLead.add(objlead);
        }
        INSERT lstLead;
    }
    static testmethod void test(){
        Test.startTest();
        
        LeadProcessor objBatch = new LeadProcessor(); 
        Id batchId = Database.executeBatch(objBatch);
        
        Test.stopTest();
        System.assertEquals(200,[select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}