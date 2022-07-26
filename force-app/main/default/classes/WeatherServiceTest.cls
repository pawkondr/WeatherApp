/**
 * Created by pawko on 26.07.2022.
 */

@IsTest
public with sharing class WeatherServiceTest {

    @IsTest
    public static void shouldReturnGoodResponse() {

        Test.setMock(HttpCalloutMock.class, new WeatherServiceMocks.WeatherServiceGoodResponseMock());

        WeatherService service = new WeatherService();
        WeatherResponse response = service.deserializeResponse(service.callWeatherService('10001'));

        System.assertEquals('New York', response.location.name);
        System.assertEquals(26.6, response.forecast.forecastDay[0].day.avgtemp_c);
        System.assertEquals('Sunny', response.forecast.forecastDay[0].day.condition.text);
        System.assertEquals(null, response.error);
    }

    @IsTest
    public static void shouldReturnLocationNotFoundResponse() {

        Test.setMock(HttpCalloutMock.class, new WeatherServiceMocks.WeatherServiceLocationNotFoundMock());

        WeatherService service = new WeatherService();
        WeatherResponse response = service.deserializeResponse(service.callWeatherService('wrong location'));

        System.assertEquals(null, response.location);
        System.assertEquals(null, response.forecast);
        System.assertEquals('No matching location found.', response.error.message);
        System.assertEquals(1006, response.error.code);
    }

    @IsTest
    public static void shouldReturnServiceNotFoundResponse() {

        Test.setMock(HttpCalloutMock.class, new WeatherServiceMocks.WeatherServiceServiceNotFoundMock());

        //Assume that service is not working
        try{
            WeatherService service = new WeatherService();
            service.deserializeResponse(service.callWeatherService('10001'));
        } catch (Exception ex){
            System.assert(ex != null, 'Assume that exception has been thrown');
        }
    }
}
