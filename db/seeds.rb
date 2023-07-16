# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

UserGroup.destroy_all
User.destroy_all
groups = UserGroup.create([{description: "admin"}, {description: "candidate"}, {description: "staff"}])
daniel = User.create(email: "daniel@email.com")
daniel.user_groups = [groups[0],groups[2]]
daniel.save()
User.create(email: "maria@eamil.com", user_groups: [groups[1]])