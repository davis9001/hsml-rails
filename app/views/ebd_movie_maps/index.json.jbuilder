json.array!(@ebd_movie_maps) do |ebd_movie_map|
  json.extract! ebd_movie_map, :id, :description, :ebd_id, :movie_id
  json.url ebd_movie_map_url(ebd_movie_map, format: :json)
end
