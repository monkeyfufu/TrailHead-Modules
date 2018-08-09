@isTest
private class WarehouseCalloutServiceTest {
  // implement your mock callout test here
  // 
    static  testmethod void TrailheadCover100(){
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}