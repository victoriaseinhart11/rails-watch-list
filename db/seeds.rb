# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"
require "open-uri"


url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)
url2 = "https://image.tmdb.org/t/p/original"

10.times do
  movieRandom = movie["results"].sample
  Movie.create(title: movieRandom["title"], overview: movieRandom["overview"], rating: movieRandom["vote_average"], poster_url: "#{url2}#{movieRandom["poster_path"]}")
end
