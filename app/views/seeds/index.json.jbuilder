json.array!(@seeds) do |seed|
  json.extract! seed, :id, :prompt
  json.url seed_url(seed, format: :json)
end
