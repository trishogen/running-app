# running-app
Ruby on Rails Running App that allows you to track runs with information about
the route or trail, such as distance, elevation, and a description. Users can
also log their runs to keep track of how often they run, times they have spent
on trails, and their moods/how they felt, as well as other information.

## Running Locally

To get the backend working, first install dependencies, then create the database,
then start up the server.

#### Install Dependencies
Matching game uses Ruby version 2.6.1, to install its dependencies run `bundle install` from the root.

#### Set up database
From the root run:

```
cd matching-game-backend
rails db:create
rails db:migrate
```

#### Start up Server
`rails s`

You will be able to access the app via http://localhost:3000/ by default, but
this can be configured) using `-p` and `-b` switches.

## Future Improvements
* Make it pretty (add CSS and photos)
* Build out test suite
* Add to the stats page using class scope methods
* Add to option to add upload photos
* Potentially other OmniAuth options (currently using only Google)
