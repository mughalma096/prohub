json.extract! technology, :id, :name, :logo, :created_at, :updated_at
json.url technology_url(technology, format: :json)
json.logo url_for(technology.logo)
