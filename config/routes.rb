Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions",
                                                         registrations: "students/registrations" }
  devise_for :teachers, path: 'teachers', controllers: { sessions: "teachers/sessions",
                                                         registrations: "teachers/registrations" }

  root 'application#welcome'
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
