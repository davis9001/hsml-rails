json.array!(@ebds) do |ebd|
  json.extract! ebd, :id, :name, :description, :wikipedia_url
  json.url ebd_url(ebd, format: :json)
end
