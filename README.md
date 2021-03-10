# <div align="center">  Sweater Weather

## Description
 Sweater Weather is an API app that provides information for users to see the current weather as well as the forecasted weather at the destination of a trip.
 
## Table of Contents
- [API Endpoints](#api-endpoints)
- [Schema](#schema)
- [Technology](#technology)
- [Instructions](#instructions)
- [Achievements](#achievements)
- [Contributors](#contributors)
- [Acknowledgements](#acknowledgements)

## API Endpoints
* **GET** /api/v1/forecast?location={location} **exposes the current, next 5 days, and next 8 hours of forecast data for a location**
* **GET** /api/v1/backgrounds?location={location} **exposes an image url that matches the location and location's current weather, as well as the credit for that image**
* **POST** /api/v1/users body: {
          "email": "test@example.com",
          "password": "password",
          "password_confirmation": "password"
        } **creates a new user within the system**
* **POST** api/v1/sessions body: {
  "email": "whatever@example.com",
  "password": "password"
} **creates a new session within the system**
* **POST** /api/v1/road_trip body: {
  "origin": "LosAngeles,CA",
  "destination": "NewYorkCity,NY",
  "api_key": "y6wmZfqUp8IydW1ACaw9Qwtt"
} **returns attributes of a road trip including the start city, end city, travel time, and the temperature and conditions at the destination city at the time of arrival**


## Schema
The database holds only one table: Users, which holds an email, password_digest, and api_key.

## Technology
   ![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)    ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Code-CSS-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) 

## Instructions
For usage on your local machine follow the instructions listed below:
```
git clone git@github.com:catherinemdean15/sweater-weather.git
cd sweater-weather
bundle install
rake db:{drop,create,migrate,seed}
rails server
```
Now, navigate to `http://localhost:3000/` on your browser to consume the API!

This is the information for the [sweater weather project](https://backend.turing.io/module3/projects/sweater_weather/) used for Turing's Backend Module 3.

## Achievements
- Consume MapQuest API to obtain a geocode for a city
- Consume OpenWeather API to obtain weather information and forecasted weather for a city
- Consume Unsplash API to obtain an image of a city
- Expose all required API endpoints

## Contributors 
[Catherine Dean](https://github.com/catherinemdean15)


## Acknowledgements
[MapQuest API](https://developer.mapquest.com/documentation/geocoding-api/address/get/)
[OpenWeather API](https://openweathermap.org/api/one-call-api)
[Unsplash API](https://unsplash.com/developers)
