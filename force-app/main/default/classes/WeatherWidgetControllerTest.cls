/**
 * Created by pawko on 26.07.2022.
 */

@IsTest
public with sharing class WeatherWidgetControllerTest {

    @IsTest
    public static void shouldReturnWeatherResponse() {

        Test.setMock(HttpCalloutMock.class, new WeatherServiceMocks.WeatherServiceGoodResponseMock());

        WeatherResponse response = WeatherWidgetController.getWeather('10001');

        System.assertEquals('New York', response.location.name);
        System.assertEquals(26.6, response.forecast.forecastDay[0].day.avgtemp_c);
        System.assertEquals('Sunny', response.forecast.forecastDay[0].day.condition.text);
        System.assertEquals(null, response.error);
    }

    @IsTest
    public static void shouldReturnLocationNotFoundErrorAndThrowException() {

        Test.setMock(HttpCalloutMock.class, new WeatherServiceMocks.WeatherServiceLocationNotFoundMock());

        try {
            WeatherWidgetController.getWeather('wrong location');
        } catch (Exception ex) {
            System.assert(ex instanceof AuraHandledException);
        }
    }

    @IsTest
    public static void shouldReturnServiceNotFoundResponse() {

        try {
            WeatherWidgetController.getWeather('doesnt matter');
        } catch (Exception ex) {
            System.assert(ex instanceof AuraHandledException);
        }
    }


}
