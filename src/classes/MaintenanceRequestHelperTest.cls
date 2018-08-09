@isTest
public class MaintenanceRequestHelperTest {
    
    @TestSetup
    private static void testSetUp(){
        Case objNewCase =  new Case();        
        objNewCase.Type = 'Routine Maintenance'; 
        objNewCase.Subject = 'routine checkup';                            
        objNewCase.Origin = 'Web';
        objNewCase.Status = 'New';
        objNewCase.Date_Reported__c = Date.today(); 
        Insert objNewCase;
        
        Product2 objPro = new Product2();
        objPro.Cost__c = 255;
        //objPro.Id = String.valueOf(mp.get('_id'));
        objPro.Maintenance_Cycle__c = 360;
        objPro.Name = 'Test Pro';
        objPro.Current_Inventory__c =  12;
        objPro.Replacement_Part__c = true;
        objPro.Lifespan_Months__c = 1;
        INSERT objPro;
        list<Work_Part__c> lstWP = new list<Work_Part__c>();
        for(integer i=0;i<10;i++){
             Work_Part__c objWP = new Work_Part__c(Maintenance_Request__c = objNewCase.ID,
                                              Equipment__c = objPro.ID, 
                                              Quantity__c = 1 );
            lstWP.add(objWP);
        }
       
        UPSERT lstWP;
    }
    static testmethod void cover100(){
        Case objCase = [select ID,Status from case where Type = 'Routine Maintenance'  limit 1];
        objCase.Status = 'closed';
        UPdate objCase;
        System.assertEquals(1, [select count() from case where Type = 'Routine Maintenance' and status != 'Closed' ]);
    }
}