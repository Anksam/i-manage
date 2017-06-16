Rails.application.routes.draw do

  resources :expenses
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root "static_pages#auth_route", as: "authenticated_root"
  end

  root "static_pages#landing_page"

  resources :incomes

  controller :static_pages do
    get :trouble_page
    get :auth_route
  end

end
