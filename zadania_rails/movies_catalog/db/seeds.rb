# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ola = User.create(first_name: 'Ola', last_name: 'Cichoń', email: 'ola@email.com', password: 'ola123', password_confirmation: 'ola123', admin: true)
