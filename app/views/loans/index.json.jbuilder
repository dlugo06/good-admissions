json.array!(@loans) do |loan|
  json.extract! loan, :id, :student_id
  json.url loan_url(loan, format: :json)
end
