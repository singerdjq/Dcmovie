json.extract! movie, :id, :image_url, :name, :year, :description, :price, :created_at, :updated_at
json.url movie_url(movie, format: :json)
