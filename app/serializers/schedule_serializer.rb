class ScheduleSerializer < ActiveModel::Serializer
  attributes :name
  has_many :appointments
end
