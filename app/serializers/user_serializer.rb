class UserSerializer < ActiveModel::Serializer
  has_one :role

  attributes :id, :name, :role_id, :email, :total_worked_hours

end
