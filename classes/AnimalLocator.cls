public class AnimalLocator {
    
    public static String getAnimalNameById(Integer intId){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+intId);
        req.setMethod('GET');
        HttpResponse response = http.send(req);
        String resturnVal = '';
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
           
            resturnVal = String.valueOf(animal.get('name'));
        }
        return resturnVal;
    }
}