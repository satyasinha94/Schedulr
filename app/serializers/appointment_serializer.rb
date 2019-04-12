class AppointmentSerializer < ActiveModel::Serializer
  attributes :start_time, :end_time, :id
  belongs_to :schedule
end
