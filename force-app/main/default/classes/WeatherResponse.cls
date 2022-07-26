/**
 * Created by pawko on 25.07.2022.
 */

public with sharing class WeatherResponse {
    @AuraEnabled public Location location;
    @AuraEnabled public Forecast forecast;
    @AuraEnabled public Error error;
    public class Location {
        @AuraEnabled public String name;
        @AuraEnabled public String region;
        @AuraEnabled public String country;
        @AuraEnabled public Double lat;
        @AuraEnabled public Double lon;
        @AuraEnabled public String tz_id;
        @AuraEnabled public Integer localtime_epoch;
        @AuraEnabled public String localtime;
    }
    public class Forecast {
        @AuraEnabled public ForecastDay[] forecastDay;
    }
    public class ForecastDay{
        @AuraEnabled public Day day;
    }
    public class Day {
        @AuraEnabled public Double maxtemp_c;
        @AuraEnabled public Double maxtemp_f;
        @AuraEnabled public Double mintemp_c;
        @AuraEnabled public Double mintemp_f;
        @AuraEnabled public Double avgtemp_c;
        @AuraEnabled public Double avgtemp_f;
        @AuraEnabled public Double maxwind_mph;
        @AuraEnabled public Double maxwind_kph;
        @AuraEnabled public Double totalprecip_mm;
        @AuraEnabled public Double totalprecip_in;
        @AuraEnabled public Double avgvis_km;
        @AuraEnabled public Double avgvis_miles;
        @AuraEnabled public Double avghumidity;
        @AuraEnabled public Double daily_will_it_rain;
        @AuraEnabled public Double daily_chance_of_rain;
        @AuraEnabled public Double daily_will_it_snow;
        @AuraEnabled public Double daily_chance_of_snow;
        @AuraEnabled public Condition condition;
        @AuraEnabled public Double uv;
    }
    public class Condition {
        @AuraEnabled public String text;
        @AuraEnabled public String icon;
    }
    public class Error {
        @AuraEnabled public String message;
        @AuraEnabled public Integer code;
    }
}
