# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
r2 = Role.create({name: "Central", description: "Can read data from many sources"})
r3 = Role.create({name: "Regional", description: "Can add votes from his constituency"})
u1 = User.create({name: "Admin", email: "admin@example.com", password: "admin123", password_confirmation: "admin123", role_id: r1.id})
u2 = User.create({name: "Członek CKW 1", email: "ckw@example.com", password: "ckwckw123", password_confirmation: "ckwckw123", role_id: r2.id})
u3 = User.create({name: "Członek OKW 1", email: "okw@example.com", password: "okwokw123", password_confirmation: "okwokw123", role_id: r3.id})
u4 = User.create({name: "Członek OKW 2", email: "okw2@example.com", password: "okwokw123", password_confirmation: "okwokw123", role_id: r3.id})