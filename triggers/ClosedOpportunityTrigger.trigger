trigger ClosedOpportunityTrigger on Opportunity (before insert,after insert, before update,after update) {

    trailhead_apexTriggerOpp obj = new trailhead_apexTriggerOpp();
     if(Trigger.isInsert){
        if(Trigger.isBefore){
			obj.isBeforeInsert(Trigger.new);        
        }else if(Trigger.isAfter){
            obj.isAfterInsert(Trigger.new);
        }
     }else if(Trigger.isUpdate){
         if(Trigger.isBefore){
			obj.isBeforeUpdate(Trigger.new);    
        }else if(Trigger.isAfter){
            obj.isAfterUpdate(Trigger.new);
        }
     }
}