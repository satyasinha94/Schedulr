Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :schedules, only: [:index, :create, :show, :destroy]
      post '/schedules/:id/appointments', to: 'appointments#create'
      delete '/schedules/:id/appointments/:appt_id', to: 'schedules#remove_appointment'
    end
  end
end
