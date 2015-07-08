json.array!(@organisations) do |organisation|
  json.extract! organisation, :id, :name, :categories_id
  json.url organisation_url(organisation, format: :json)
end
