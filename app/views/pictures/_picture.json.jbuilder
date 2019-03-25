json.extract! picture, :id, :name, :year, :nominations, :rating, :genre1, :genre2, :release, :synopsis, :created_at, :updated_at
json.url picture_url(picture, format: :json)
