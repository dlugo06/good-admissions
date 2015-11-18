json.array!(@wires) do |wire|
  json.extract! wire, :id, :student_id
  json.url wire_url(wire, format: :json)
end
