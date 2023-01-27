# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
data = JSON.parse(URI.open(url).read)

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"
puts 'Creating amazing movies...!'

data['results'].each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w1280#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
