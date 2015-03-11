json.array!(@reviews) do |review|
  json.extract! review, :id, :venue_id, :user_id, :review_body, :rating
  json.url review_url(review, format: :json)
end
