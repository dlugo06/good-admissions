json.array!(@performance_charts) do |performance_chart|
  json.extract! performance_chart, :id
  json.url performance_chart_url(performance_chart, format: :json)
end
