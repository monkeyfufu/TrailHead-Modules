public with sharing class WarehouseCalloutService {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(Callout=true)
    public static void runWarehouseEquipmentSync(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(WAREHOUSE_URL);
        req.setMethod('GET');
        HttpResponse response = http.send(req);
        System.debug('response-->'+response.getBody());
        String strResponse = response.getBody();
        
        List<Object> mpResponse = (list<Object>)JSON.deserializeUntyped(strResponse);
        System.debug('mpResponse--->'+mpResponse);
        List<Product2> lstProduct = new List<Product2>();
        for(Object obj : mpResponse){
            
            map<String,object> mp = (map<String,Object>)JSON.deserializeUntyped(JSON.serialize(obj));
            
            Product2 objPro = new Product2();
            objPro.Cost__c = Decimal.valueOf(String.valueOf(mp.get('cost')));
            //objPro.Id = String.valueOf(mp.get('_id'));
            objPro.Maintenance_Cycle__c = Decimal.valueOf(String.valueOf(mp.get('maintenanceperiod')));
            objPro.Name = String.valueOf(mp.get('name'));
            objPro.Current_Inventory__c =  Decimal.valueOf(String.valueOf(mp.get('quantity')));
            objPro.Replacement_Part__c = Boolean.valueOf(mp.get('replacement'));
            objPro.Warehouse_SKU__c = String.valueOf(mp.get('sku'));
            objPro.Lifespan_Months__c =  Decimal.valueOf(String.valueOf(mp.get('lifespan')));
            lstProduct.add(objPro);
        }
        UPSERT lstProduct;
        
    }
    
}