# README

To add/remove an appointment, you must specify the schedule of the appointment in the url:
Examples:
curl -X DELETE http://localhost:3000/api/v1/schedules/1/appointments/2

curl -X POST --data "start_time=1&end_time=2" http://localhost:3000/api/v1/schedules/1/appointments

End time of appointments must be greater than the start time
