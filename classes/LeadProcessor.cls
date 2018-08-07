global  class LeadProcessor implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(database.BatchableContext bc){
        String strQuery = 'select id, LeadSource from Lead';
        return database.getQueryLocator(strQuery);
    }
    global void execute(database.BatchableContext bc,list<Lead> lstLead){
        list<Lead> lstLeadToUpdate = new list<Lead>();
        for(Lead objLead: lstLead){
            objLead.LeadSource = 'Dreamforce';
            lstLeadToUpdate.add(objLead);  
        }
        UPDATE lstLeadToUpdate;
    }
    global void finish(database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        System.debug('No of JobItemsProcessed: -->'+job.JobItemsProcessed);
    }
}