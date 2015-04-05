json.array!(@employees) do |employee|
  json.extract! employee, :id, :firstname, :lastname, :email, :phone
  json.url employee_url(employee, format: :json)
end
