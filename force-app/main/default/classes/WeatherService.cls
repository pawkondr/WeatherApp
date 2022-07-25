/**
 * Created by pawko on 25.07.2022.
 */

public with sharing class WeatherService {

    private final static String METADATA_SETTING_NAME = 'Settings Version 1';

    public WeatherResponse deserializeResponse(String response){
        return (WeatherResponse)JSON.deserialize(response, WeatherResponse.class);
    }

    public String callWeatherService(String query) {
        Weather_Setting__mdt weatherSetting = getWeatherSetting();

        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(weatherSetting.Endpoint__c + '?q=' + query);
        request.setMethod('GET');
        request.setHeader('key', weatherSetting.Key__c);
        request.setCompressed(false);
        HttpResponse response = httpProtocol.send(request);
        System.debug('response ##' + response.getBody());
        return response.getBody();
    }

    public Weather_Setting__mdt getWeatherSetting(){
        return [SELECT Id, Endpoint__c, Key__c FROM Weather_Setting__mdt WHERE Label = :METADATA_SETTING_NAME];
    }
}
