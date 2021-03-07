# <div align="center">  Sweater Weather

## Description
 Sweater Weather is an API app that provides information for users to see the current weather as well as the forecasted weather at the destination of a trip.
 
## Table of Contents
- [Schema](#schema)
- [Technology](#technology)
- [Achievements](#achievements)
- [Instructions](#instructions)
- [Design Strategy](#design-strategy)
- [Future Functionality](#future-functionality)
- [Contributors](#contributors)
- [Acknowledgements](#acknowledgements)

## Schema


## Technology
   ![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)    ![](https://img.shields.io/badge/Code-HTML-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Code-CSS-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) [![Build Status](https://travis-ci.com/ninesky00/viewing_party.svg?branch=main)](https://travis-ci.com/ninesky00/viewing_party)

## Instructions
This application is hosted on [Heroku](https://stormy-bastion-67887.herokuapp.com/), where you'll be able to consume the exposed API.

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
- Consume OpenWeather API to obtain weather information and forecasted weather for a city.

## Future Functionality
- More to come! 
- 
## Contributors 
[Catherine Dean](https://github.com/catherinemdean15)


## Acknowledgements
[MapQuest API](https://developer.mapquest.com/documentation/geocoding-api/address/get/)
[OpenWeather API](https://openweathermap.org/api/one-call-api)
