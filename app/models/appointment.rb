class Appointment < ApplicationRecord
  belongs_to :schedule
  validates :start_time, :end_time, presence: true, numericality: true
  validates :end_time, numericality: {greater_than: :start_time}  
end
