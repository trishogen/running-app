# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {
  email: "seed_user@aol.com",
  first_name: "seedy",
  password: "iamseeduser"}

user = User.create(user)

routes = [
  {title: "Prospect Park Loop", location: "Brooklyn", distance: 3.2,
    elevation: 500, description: "Easy loop around prospect park"},
  {title: "West Side Highway", location: "Manhattan", distance: 5.0,
    elevation: 450, description: "Scenic route along the highway"}
  ]

first_route = Route.new(routes[0])
first_route.creator = user
first_route.save

second_route = Route.new(routes[1])
second_route.creator = user
second_route.save

runs = [
  {title: "Sunday Morning Run", date: "2021-09-27 00:00:00", run_time:17, mood: "Tired"},
  {title: "Thursday Night Jog", date: "2021-10-01 00:00:00", run_time: 32, mood: "great"}
  ]

first_run = user.runs.build(runs[0])
first_run.route = first_route
first_run.save

second_run = user.runs.build(runs[1])
second_run.route = second_route
second_run.save
