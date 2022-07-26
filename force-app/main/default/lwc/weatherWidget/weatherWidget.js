/**
 * Created by pawko on 25.07.2022.
 */

import {LightningElement, track} from 'lwc';
import getWeather from '@salesforce/apex/WeatherWidgetController.getWeather'

export default class WeatherWidget extends LightningElement {
    @track searchKey;
    isMetric = true;
    location;
    weather;
    error;

    units = {
        heat: '',
        speed: '',
        distance: '',
        smallDistance: ''
    }

    handleGetWeather() {
        let inputField = this.template.querySelector('lightning-input');
        if (!inputField.validity.valid) return;
        this.searchKey = inputField.value;
        getWeather({query: this.searchKey})
            .then((result) => {
                this.error = null;
                this.location = result.location;
                this.weather = result.forecast.forecastDay[0].day;
                this.setUnits();
            })
            .catch((error) => {
                this.error = error.body.message;
                this.location = null;
                this.weather = null;
            })
    }

    setUnits() {
        this.units.heat = this.isMetric ? '°C' : '°F';
        this.units.speed = this.isMetric ? 'km/h' : 'MPH';
        this.units.distance = this.isMetric ? 'km' : 'Miles';
        this.units.smallDistance = this.isMetric ? 'mm' : 'in';
    }

    handleChange(event) {
        this.isMetric = event.target.checked;
        this.setUnits();
    }
}
