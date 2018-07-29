public class RandomContactFactory {

    public static list<Contact> generateRandomContacts(Integer Count, String strName){
        List<Contact> lstContact = new list<Contact>();
        for(Integer i=1 ;i<=count; i++){
            Contact ObjCon = new Contact(LastName = strName,firstName = 'Test '+i);
            lstContact.add(ObjCon);
        }
        return lstContact;
    }
}