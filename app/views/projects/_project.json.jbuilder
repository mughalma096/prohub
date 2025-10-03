json.extract! project, :id, :name, :description, :start_date, :end_date, :cover, :images, :created_at, :updated_at
json.url project_url(project, format: :json)
json.cover url_for(project.cover)
json.images do
  json.array!(project.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
