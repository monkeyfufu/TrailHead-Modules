public class trailhead_apexTriggerAcc {
    public void isBeforeInsert(List<Account> lstNew){
        for(Account objAcc: lstNew){
            if(objAcc.Match_Billing_Address__c){
                objAcc.BillingPostalCode = ObjAcc.ShippingPostalCode;
            }
        }
    }
}