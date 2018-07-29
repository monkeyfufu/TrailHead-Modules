@isTest
public class TestRestrictContactByName {

    @isTest static void trailheadModuleTestClass(){
        Contact objCon = new Contact(LastName='INVALIDNAME');
        try{
        	INSERT objCon;
        }catch(Exception ex){
            System.debug('ERROR:: '+ex);
        }
    }
}