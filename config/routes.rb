Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "application#welcome"
  get "chat_room/", to: "application#chat"
  scope "/:locale" do
    devise_for :students, path: "students", controllers: {sessions: "students/sessions",
                                                          registrations: "students/registrations",
                                                          passwords: "students/passwords"}
    devise_for :teachers, path: "teachers", controllers: {sessions: "teachers/sessions",
                                                          registrations: "teachers/registrations",
                                                          passwords: "students/passwords"}

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
  end

  get "up" => "rails/health#show", :as => :rails_health_check
end
