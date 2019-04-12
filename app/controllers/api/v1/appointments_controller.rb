class Api::V1::AppointmentsController < ApplicationController

  def create
    #Grabs id of schedule so user can't assign appointment to a schedule with an id different from the id in the request url.
    schedule_id = request.url.to_s.scan(/\d+/)[2]
    @appointment = Appointment.new(start_time: params[:start_time], end_time: params[:end_time], schedule_id: schedule_id)
    if @appointment.save
      render json: {status: 'SUCCESS', message: 'Created Appointment', data: @appointment}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Creation failed', data: @appointment.errors}, status: :unprocessable_entity
    end
  end

  private
  def appointment_params
    params.permit(:start_time, :end_time, :schedule_id)
  end

end
