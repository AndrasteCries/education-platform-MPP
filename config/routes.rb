Rails.application.routes.draw do
  resources :subject_teachers
  resources :groups
  resources :teachers
  resources :subjects
  resources :lessons
  resources :tasks
  resources :students
  resources :marks

  get "up" => "rails/health#show", as: :rails_health_check

end
