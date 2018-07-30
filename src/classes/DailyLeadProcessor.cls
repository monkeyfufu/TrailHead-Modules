global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx) {
        list<Lead> lstLead = new list<Lead>();
        for(Lead objLead :[select id, LeadSource  from lead where LeadSource ='' or LeadSource = null limit 200]){
            objLead.LeadSource = 'Dreamforce';
            lstLead.add(objLead);
        }
        UPDATE lstLead;
    }
    
}