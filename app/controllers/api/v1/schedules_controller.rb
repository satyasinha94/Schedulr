class Api::V1::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    render json: @schedules
  end

  def show
    @schedule = find_schedule
    render json:  @schedule
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          error: e.to_s
        }, status: :not_found
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      render json: {status: 'SUCCESS', message: 'Created Schedule'}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Creation failed', data: @schedule.errors}, status: :unprocessable_entity
    end
  end

  def remove_appointment
     @schedule = find_schedule
     #grabs last number in url and saves it as the id of the appointment to remove
     #currently not working because grabbing id of schedule not appointment
     nums = request.url.to_s.scan(/\d+/)
     appointment_id = nums[nums.length - 1]
     puts appointment_id
     puts request.url
     Appointment.find(appointment_id).delete
     render json: {status: 'SUCCESS', message: 'Appointment Removed'}, status: :ok
  end

  def destroy
    find_schedule.destroy
    render json: {status: 'SUCCESS', message: 'Deleted Schedule and corresponding appointments', data: @schedule}, status: :ok
  end

  private

  def schedule_params
    params.permit(:name)
  end

  def find_schedule
    Schedule.find(params[:id])
  end

end
