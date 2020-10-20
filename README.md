# README

Quick Recipes seacher for a challenge and to try out the Full Text Search provided by postgresql

Heroku link : https://stark-journey-64762.herokuapp.com/

## User stories

- As a User, I want a search function who allows me to search for recipes by entering ingredients I have in my fridge, so i can cook something for my friends
- As a User with vegetarien friends, I want to be able to use this app and adding the "végétarien", so I can cook something for my vegetarian friends
- As a User, I want to be able to look for all recipes from one user
- As a User, I want to be able to look for all recipes with a common tag


## Things to add

- Add a few test on recipe's model and controller
- Add the ignoring accents feature of postgresql
- Add a filter on preparation time and rate
- Build a "Multi-search" style search and conpare result and querry eficiency
- `negation: true` combine with `any_word` give unpredictable result : Open a PR on `pg_search` with a failing test

## DB structure

See db/structure.sql
