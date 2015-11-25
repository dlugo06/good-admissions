json.array!(@cohorts) do |cohort|
  json.extract! cohort, :id, :name, :location, :cohort_number, :capacity, :start_date
  json.url cohort_url(cohort, format: :json)
end
