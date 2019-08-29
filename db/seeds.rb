# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({id: 1, name: "Regular", description: "Can read shifts"})
r3 = Role.create({id: 2, name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa",  password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})

h1 = Hour.create({notes: "", date_start: "2019-05-17 08:00:00", date_end: "2019-05-17 16:00:00", user_id: u2.id})

