# README

# Lunch and Learn Backend Service

The goal of this project is to create a variety of endpoints for an imagined frontend application will allow a user to search for cuisines by country, while providing opportunities to learn more about that country's culture. This app would allow users to search for recipes by country, add favorite recipes to their account, and provide images and video materials to learn more about that particular country.

# Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Implement low-level caching
* Test both API consumption and exposure, making use of VCR as a mocking tool

## Setup
This project requires Ruby 2.7.4 

1. Fork and clone this repository.
2. `cd` into the root directory.
3. Run `bundle install`
4. Run `rails db:{drop,create,migrate,seed}`
5. Configure Environment Variables, see below.

### Environment Variables

The app makes calls to the [Youtube](https://developers.google.com/youtube/v3/docs), [Unsplash](https://unsplash.com/developers), [GeoApify](https://myprojects.geoapify.com/projects), [Edamam](https://developer.edamam.com/edamam-recipe-api), and [RestCountries](https://restcountries.com/#api-endpoints-v3-all) API. 
You will need to register and acquire your own API keys for all but the RestCountries API to produce any functional endpoints.

This project includes the Figaro gem in the Gemfile, but any credential tool can work. 
To use Figaro: 
https://github.com/laserlemon/figaro#:~:text=Figaro%20installation%20is%20easy%3A   
Start at `bundle exec figaro install` 

The variable names of your api keys must follow this pattern.    
```
app_id: <YOUR EDAMAN KEY>
app_key: <YOUR EDAMAM KEY>

GOOGLE_API_KEY: <GOOGLE KEY>
PLACE_API_KEY: <YOUR GEOAPIFY PLACE KEY>
UNSPLASH_ACCESS_KEY: <UNSPLASH KEY>
```   

## API Endpoints
```GET /api/v1/recipes?country=QUERY
GET /api/v1/learning_resources?country=QUERY
POST /api/v1/users
POST /api/v1/favorites
GET /api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4```
