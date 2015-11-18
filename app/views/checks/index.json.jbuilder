json.array!(@checks) do |check|
  json.extract! check, :id, :student_id
  json.url check_url(check, format: :json)
end
