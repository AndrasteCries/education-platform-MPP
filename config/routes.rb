Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions",
                                                         registrations: "students/registrations" }
  devise_for :teachers, path: 'teachers', controllers: { sessions: "teachers/sessions",
                                                         registrations: "teachers/registrations" }

  root 'application#welcome'
  resources :subject_teachers
  resources :groups do
    member do
      get 'add_students', action: 'add_students_form'
      get 'remove_students', action: 'remove_students_form'
    end
    post 'add_students', on: :member
    post 'remove_students', on: :member
  end
  resources :teachers
  resources :subjects
  resources :lessons
  resources :tasks
  resources :students
  resources :marks

  get "up" => "rails/health#show", as: :rails_health_check

end
