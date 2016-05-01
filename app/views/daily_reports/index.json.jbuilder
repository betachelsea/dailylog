json.array!(@daily_reports) do |daily_report|
  json.extract! daily_report, :id, :date, :body, :user_id
  json.url daily_report_url(daily_report, format: :json)
end
