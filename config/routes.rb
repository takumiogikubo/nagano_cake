Rails.application.routes.draw do


  scope module: 'public' do
    root to: "homes#top"
    get "/about"=>"homes#about"
    resources :items, only:[:index,:show]
    get 'customers/my_page' => 'customers#show'
    resources :customers, only:[:update] do
      member do
        get 'unsubscrib'
      end
      collection do
        get 'edit'
        patch 'withdraw'
      end
    end
    resources :cart_items, only:[:index,:update,:create,:destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only:[:new,:create,:index,:show] do
      collection do
        post 'comfirm'
        get 'complete'
      end
    end
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index,:new,:update,:create,:show,:edit]
    resources :genres, only:[:index,:new,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:show,:update]
    resources :order_details, only:[:update]
  end


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
