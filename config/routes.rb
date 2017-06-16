Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root "static_pages#auth_route", as: "authenticated_root"
  end

  root "static_pages#landing_page"

  resources :incomes, except: [:show]
  resources :expenses, except: [:show]

  controller :static_pages do
    get :trouble_page
    get :auth_route
  end

end
