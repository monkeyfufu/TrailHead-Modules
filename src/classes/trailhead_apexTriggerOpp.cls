public class trailhead_apexTriggerOpp {
    
    public void isBeforeInsert(List<Opportunity> lstOpp){
        
    }
    public void isAfterInsert(List<Opportunity> lstOpp){
        createTask(lstOpp);
    }
    public void isBeforeUpdate(List<Opportunity> lstOpp){
        
    }
    public void isAfterUpdate(List<Opportunity> lstOpp){
        createTask(lstOpp);
    }
    private void createTask(list<Opportunity> lstOpp){
        list<Task> lstTask = new list<Task>();
        for(Opportunity objOpp : lstOpp){
            if(objOpp.StageName == 'Closed Won'){
                task objTask = new Task();
                objTask.Subject = 'Follow Up Test Task';
                objTask.WhatId = objOpp.Id;
                lstTask.add(objTask);
            }
        }
        INSERT lstTask;
    }
}