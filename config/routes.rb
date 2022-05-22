Rails.application.routes.draw do

  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index,:new,:create,:show,:edit,:update]
    # get 'items/index'
    # get 'items/new'
    # get 'items/show'
    # get 'items/edit'
    resources :genres, only:[:index,:create,:edit,:update]
    # get 'genres/index'
    # get 'genres/edit'
    resources :customers, only:[:index,:show,:edit,:update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    resources :orders, only:[:show,:update]
    # get 'orders/show'
    resources :order_details, only:[:update]
  end


    get "/about"=>"homes#about"
    root to: "homes#top"
    resources :items, only:[:index,:show]
    # get 'items/index'
    # get 'items/show'
    resources :customers, only:[:show,:edit,:update] do
      member do
        get 'unsubscrib'
      end
      collection do
        patch 'withdraw'
      end
    end
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/unsubscrib'
    # get 'customers/withdraw'
    resources :cart_items, only:[:index,:update,:create] do
      member do
        delete 'destroy'
      end
      collection do
        delete 'destroy_all'
      end
    end
    # get 'cart_items/index'
    resources :orders, only:[:new,:create,:index,:show] do
      collection do
        post 'comfirm'
        get 'complete'
      end
    end
    # get 'orders/new'
    # get 'orders/comfirm'
    # get 'orders/complete'
    # get 'orders/index'
    # get 'orders/show'
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
    # get 'addresses/index'
    # get 'addresses/edit'


# devise_for :customers
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# devise_for :admins
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
