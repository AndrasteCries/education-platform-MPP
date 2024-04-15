# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Devise routes for students
  devise_for :students, path: "students", controllers: {
    sessions: "students/sessions",
    registrations: "students/registrations"
  }

  # Devise routes for teachers
  devise_for :teachers, path: "teachers", controllers: {
    sessions: "teachers/sessions",
    registrations: "teachers/registrations"
  }

  # Custom routes
  get "chat_room/", to: "application#chat"
  root "application#welcome"

  # Resources routes
  resources :subject_teachers
  resources :groups do
    member do
      get "add_students", action: "add_students_form"
      get "remove_students", action: "remove_students_form"
    end
    post "set_captain", on: :member
    post "add_students", on: :member
    post "remove_students", on: :member
  end
  resources :teachers
  resources :subjects do
    member do
      get "add_group", action: "add_group_form"
    end
    post "add_group", on: :member
  end
  resources :lessons
  resources :tasks
  resources :students
  resources :marks
  resources :student_responses do
    post "evaluate", on: :member
  end

  # Health check route
  get "up" => "rails/health#show", :as => :rails_health_check
end
