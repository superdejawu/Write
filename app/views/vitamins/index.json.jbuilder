json.array!(@vitamins) do |vitamin|
  json.extract! vitamin, :description
  json.url vitamin_url(vitamin, format: :json)
end
