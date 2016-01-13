json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :plot, :plot_outline, :tagline, :rating_votes, :rating, :writers, :year_released, :thumbnails, :imdb_id, :sortable_formatted_title, :runtime, :mpaa_rating, :genre, :director, :original_title, :studio, :trailer_url, :country
  json.url movie_url(movie, format: :json)
end
