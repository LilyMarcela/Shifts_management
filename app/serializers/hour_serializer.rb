class HourSerializer < ActiveModel::Serializer
  attributes :user_id, :date_start, :date_end, :notes
end
