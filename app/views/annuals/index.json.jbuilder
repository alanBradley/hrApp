json.array!(@annuals) do |annual|
  json.extract! annual, :id, :date, :description, :employee_id
  json.url annual_url(annual, format: :json)
end
