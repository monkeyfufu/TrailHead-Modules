public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(Map<Id,Case> OldMap,map<Id,Case>  newMap){
        //map<CaseID, list<MaintenanceDays>> mapMaintenanceCycle         
        map<ID,List<Decimal>> mapMaintenanceCycle = new map<Id,List<Decimal>>();
        System.debug('Test-->'+newMap);
        list<Work_Part__c> lstWorkParts = [SELECT Id, Maintenance_Request__c, Equipment__r.Maintenance_Cycle__c 
                                           FROM Work_Part__c
                                           WHERE  Maintenance_Request__c =: newMap.keySet()
                                           ORDER By Equipment__r.Maintenance_Cycle__c  ASC NULLS LAST ];
        
        for(Work_Part__c objWorkPart : lstWorkParts){
            if(! mapMaintenanceCycle.containsKey(objWorkPart.Maintenance_Request__c)){
                mapMaintenanceCycle.put(objWorkPart.Maintenance_Request__c,new list<Decimal>());
            }
            mapMaintenanceCycle.get(objWorkPart.Maintenance_Request__c).add(objWorkPart.Equipment__r.Maintenance_Cycle__c);
        }
        
        // to update the Work_Part__c records
        Map<ID,Case> oldIdNewCase = new map<ID,Case>();
        
        // New Case Insert 
        list<Case> lstCaseInsert = new list<Case>();
        for(Case oldCase: OldMap.values()){
            case newCase = newMap.get(oldCase.Id);
            list<Decimal> lstDueDays = mapMaintenanceCycle.get(oldCase.Id);
            if((oldCase.Type == 'Repair' || oldCase.Type == 'Routine Maintenance')&& newCase.Status == 'Closed' && oldCase.Status != 'Closed' )
            {
                System.debug('lstDueDays-->'+lstDueDays);
                Case newCaseCreate = CreateNewCase(newCase,lstDueDays);
                lstCaseInsert.add(newCaseCreate);
                oldIdNewCase.put(newCase.ID,newCaseCreate);
            }
        }
        INSERT lstCaseInsert;
        
        list<Work_Part__c> lstWPUpdates = new list<Work_Part__c>();
        for(Work_Part__c objWP : lstWorkParts){
            ID newCaseID = oldIdNewCase.get(objWP.Maintenance_Request__c).ID; 
            if(newCaseID != null){
                system.debug('INside wp update');
                Work_Part__c objNewWP=new Work_Part__c(ID =objWP.ID, Maintenance_Request__c = newCaseID);
                
                lstWPUpdates.add(objNewWP);
            }
        }
        UPDATE lstWPUpdates;
    }
    private static Case CreateNewCase(Case ObjCase, List<Decimal> lstDueDays){
        Date DueDate = null;
        Date todayDate = Date.today();
        if(lstDueDays != null){
            lstDueDays.sort(); //getting small value to assign a Date_Due__c
            DueDate = todayDate.addDays(Integer.valueOf(lstDueDays[0]));
        }
         
        Case objNewCase =  ObjCase.clone(false, false, false, false);
        
        objNewCase.Type = 'Routine Maintenance'; 
        objNewCase.Subject = 'routine checkup';                            
        objNewCase.Origin = 'Web';
        objNewCase.Status = 'New';
        objNewCase.Date_Reported__c = Date.today(); 
        objNewCase.Date_Due__c = DueDate;
        
        return objNewCase;
    } 
    
}