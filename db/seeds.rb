# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movies=Movie.create(image_url:'https://upload.wikimedia.org/wikipedia/en/d/dd/2012_Poster.jpg', name: '2012' ,year: 2009,description:'2012 is a 2009 American epicscience fictiondisaster film directed and co-written by Roland Emmerich. It stars John Cusack, Chiwetel Ejiofor, Amanda Peet, Oliver Platt, Thandie Newton, Danny Glover, and Woody Harrelson. It was produced by Columbia Pictures and distributed by Sony Pictures Releasing. Filming began in August 2008 in Vancouver, although it was originally planned to be filmed in Los Angeles.',price:5.99)
users=User.create(name:'admin', password:'admin',admin:true)
orders=Order.create(name:'sakura', address:'6a printfield talk',email:'sakura@0319.com',pay_type:'Credit card' , activated: true, activated_at: Time.zone.now)
microposts=Micropost.create(content:'it is good')