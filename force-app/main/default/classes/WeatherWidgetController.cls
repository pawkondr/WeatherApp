/**
 * Created by pawko on 25.07.2022.
 */

public with sharing class WeatherWidgetController {

    @AuraEnabled
    public static WeatherResponse getWeather(String query) {
        WeatherResponse response;
        try {
            WeatherService service = new WeatherService();
            response = service.deserializeResponse(service.callWeatherService(query));
        } catch (Exception ex) {
            throw new AuraHandledException('Service is not available.');
        }
        if (response.error != null) throw new AuraHandledException(response.error.message);
        return response;
    }
}
