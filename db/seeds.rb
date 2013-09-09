# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  users =  User.create([
  { first_name:"Laura", last_name:"Erskine", phone:"425-999-1111", email:"lrskne@gmail.com" },
  { first_name:"Pauline", last_name:"Smith", phone:"206-444-7817", email:"paulineS@comcast.com" }
  ])
