Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root "dashboard#dashboard", as: "authenticated_root"
  end

  root "static_pages#landing_page"

  resources :incomes, except: [:show]
  resources :expenses, except: [:show]

  resources :income_categories
  resources :expense_categories

  controller :static_pages do
    get :trouble_page
  end

  controller :dashboard do
    get :dashboard
  end

end
