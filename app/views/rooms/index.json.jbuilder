json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :type, :price
  json.url room_url(room, format: :json)
end
