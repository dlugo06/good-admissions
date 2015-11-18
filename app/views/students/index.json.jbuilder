json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :email, :phone_num
  json.url student_url(student, format: :json)
end
