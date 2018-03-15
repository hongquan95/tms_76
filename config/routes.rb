Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"

  patch "trainer/courses/:id", to: "trainer/courses#del_course", as: "del_course"
  namespace :trainer do
    resources :courses
    resources :users, only: :show, as: "have" do
      resources :user_courses, only: :index, as: "courses"
    end
  end
  resources :users

end
