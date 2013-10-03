json.array!(@posts) do |post|
  json.extract! post, :description
  json.url post_url(post, format: :json)
end
