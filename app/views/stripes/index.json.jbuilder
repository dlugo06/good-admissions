json.array!(@stripes) do |stripe|
  json.extract! stripe, :id, :student_id
  json.url stripe_url(stripe, format: :json)
end
