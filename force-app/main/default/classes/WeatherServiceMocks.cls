/**
 * Created by pawko on 26.07.2022.
 */

@IsTest
public with sharing class WeatherServiceMocks {

    private final static String GOOD_RESPONSE = '{"location":{"name":"New York","region":"New York","country":"USA","lat":40.75,"lon":-73.99,"tz_id":"America/New_York","localtime_epoch":1658831608,"localtime":"2022-07-266:33"},"forecast":{"forecastday":[{"date":"2022-07-26","day":{"maxtemp_c":32.0,"maxtemp_f":89.6,"mintemp_c":21.7,"mintemp_f":71.1,"avgtemp_c":26.6,"avgtemp_f":79.8,"maxwind_mph":11.6,"maxwind_kph":18.7,"totalprecip_mm":0.1,"totalprecip_in":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":42.0,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png","code":1000},"uv":7.0}}]}}';
    private final static String NOT_FOUND_RESPONSE = '{"error":{"code":1006,"message":"No matching location found."}}';

    public class WeatherServiceGoodResponseMock implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(GOOD_RESPONSE);
            response.setStatusCode(200);

            return response;
        }
    }

    public class WeatherServiceLocationNotFoundMock implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(NOT_FOUND_RESPONSE);
            response.setStatusCode(400);

            return response;
        }
    }

    public class WeatherServiceServiceNotFoundMock implements HttpCalloutMock {

        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setStatusCode(500);

            return response;
        }
    }
}
