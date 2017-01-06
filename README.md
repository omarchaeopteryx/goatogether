# goatogether

## Description
An application to explore your area and plan journeys with your friends. Goatogether provides a map-based service to organize and collect your own Twitter posts.

## How to Use
+ Log in with your twitter account

### Search hashtags
+ Type a desired search (ex: #coffee, @dog_rates)
+ Use the slider to increase or decrease the radius of the search

### Start a new journey or record a previous journey
+ Open the menu, click Begin
+ Enter the title for the journey
+ Enter a future date or past date for your journey
+ Enter another Twitter user to include their tweets on the journey map

### I'm feeling Adventurous
Reccomends a journey based on past Twitter users you've gone on journeys with.

+ Open the menu
+ Click 'I'm feeling Adventurous'

## Technologies Used
Back End: Ruby on Rails, ActiveRecord, PostgreSQL  
Front End: jQuery, Ajax, Javascript, HTML, CSS  
APIs: Google Maps, Twitter
OAuth: Twitter

## Challenges
The main challenge developing goatogether was running into Twitter's Rate Limits. Goatogether relies on users sharing geolocation data to map tweets onto Google Maps. Since not all tweets have location enabled, our program takes all of the searched tweets and filters out the ones without geolocation data. Calling the seach function multiple times within a short period of time, or searching a hashtag with a lot of tweets hits Twitter's rate limit.

## Team
Jack Shelley, @jackshelley  
Christine Duane, @ckduane  
Keith James, @keithrjames  
Omar Malik, @omarchaeopteryx  
