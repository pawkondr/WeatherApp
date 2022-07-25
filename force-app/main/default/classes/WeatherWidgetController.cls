/**
 * Created by pawko on 25.07.2022.
 */

public with sharing class WeatherWidgetController {

    @AuraEnabled
    public static WeatherResponse getWeather(String query){
        WeatherService service = new WeatherService();
        return service.deserializeResponse(service.callWeatherService(query));
    }

}
