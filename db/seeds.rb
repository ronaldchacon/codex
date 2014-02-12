# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(
  username: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.save
u.update_attribute(:role, 'admin')

u = User.new(
  username: 'Premium User',
  email: 'premium@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.save
u.update_attribute(:role, 'premium')

u = User.new(
  username: 'Free User',
  email: 'free@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.save
