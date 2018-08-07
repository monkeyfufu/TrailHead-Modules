@isTest
public class DailyLeadProcessorTest{
    
    public static testMethod void TestOnLoad(){
        
        String Cron_Exp = '0 0 1 * * ?';
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0; i<200; i++){
            leadList.add(new Lead(LastName = 'Anup'+i,
                                  Company = 'Anup'+1,
                                  Status = 'Working'));
            
        }
        insert leadList; 
        
        Test.startTest();
        System.schedule('DailyLeadProcessor',Cron_Exp,new DailyLeadProcessor());
        Test.stopTest();
        
    }
}