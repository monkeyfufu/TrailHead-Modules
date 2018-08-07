@isTest
public class AnimalLocatorTest {
    
    static testmethod void testCallOut(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String retVal = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('bear', retVal);
    }
}