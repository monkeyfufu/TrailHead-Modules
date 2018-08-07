public class AddPrimaryContact implements Queueable{
	private contact objConClone;
    private String state;
    public AddPrimaryContact(contact objCon, String state){
        this.objConClone = objCon;
        this.state = state;
    }
    public void execute(QueueableContext context){
      List<Account> lstAcc = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200]; 
      list<Contact> lstCont = new list<Contact>();
        for(Account objAcc : lstAcc){
            contact objCOn = objConClone.clone(false,false,false,false); 
            objCOn.AccountId = objAcc.ID;
            lstCont.add(objCOn);
        }
        INSERT lstCont;
    }
}