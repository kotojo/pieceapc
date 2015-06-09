json.array!(@computers) do |computer|
  json.extract! computer, :id, :name, :description, :price
  json.url computer_url(computer, format: :json)
end
