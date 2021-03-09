class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type 'users'
  attributes :email, :api_key
end
