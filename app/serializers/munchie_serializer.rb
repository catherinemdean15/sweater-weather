class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type 'munchie'
  attributes :destination_city, :forecast, :restaurant, :travel_time
end
