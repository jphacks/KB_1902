# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(genre_name: "スポーツ")
User.create!(email: 'admin@admin', password: 'aaaaaa', name: 'admin')
Post.create!(user_id: 1, title: 'サンプル', body: '良かったことは「天使」でつぶやこう', genre_id: 1, choice: 0)