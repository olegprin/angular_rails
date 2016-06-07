Rails.application.routes.draw do

  
  
  mount Ckeditor::Engine => '/ckeditor'
  get 'rss' => 'rss#feed', format: 'rss' 
  #get 'sitemap' => 'home#sitemap'
  get 'robots' => 'home#robots', format: :text
  #get "sitemap.xml" => "rss#sitemap", format: :xml, as: :sitemap
  #get "robots.txt" => "rss#robots", format: :text, as: :robots



  resources :comments

  resources :infos
  put "voices/:increase_id" => "voices#increase", :as => "voices_increase"
  put "voices/:decrease_id" => "voices#decrease", :as => "voices_decrease"
  get 'results', to: 'home#search', as: 'results'
  
  get 'results_tags/:tag', to: 'home#search_tags', as: 'results_tags' 
  
  namespace :admin do
    resources  :admins, only: [:index] 
    resource :configurable
    #get "configurable/edit", as: "admin_configurable_edit"
    #resources  :clients
    #resources  :tasks
  end
  
  get 'admins/index'
    


  resources :messagestoadministrators
  resources :answerfrommoderators

  
  get 'home/index'

  get 'store/index'
  get 'store/all_category'
  get 'store/show'
  get 'store/contact'
  get 'line/increase',to: 'line_items#increase', as: :increase_line_item
  get 'line/decrease',to: 'line_items#decrease', as: :decrease_line_item
  get 'store/showlike'
  get '/change_locale/:locale', to: 'pages#change_locale', as: :change_locale
  



  
 
   
  get "info_show_from_email/:user_id" => "infos#show_from_email", :as => "user_show"
  get "info_show_from_navbar/:user_id" => "infos#show_from_navbar", :as => "user_show_navbar"
  get '/ban_the_user/:id' => 'admin/admins#ban_the_user', :as => 'ban'
  get '/make_admin/:id' => 'admin/admins#make_admin', :as => 'make_admin'
  delete 'user_delete/:id' => 'admin/admins#delete_user', as: "delete_user"
  

  #devise_for :admins do
    #collection do
    #end
  #end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  #devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  resources :infos 



  resources :films do
 
    resources :comments, module: :films do
      collection do
        get "new_with_info" => "comments#new_with_info"
      end
    end  
    collection do
      get "search" => "films#search"
      get "latest" => "films#latest"
      get "top_rated" => "films#top_rated"
      get "contact_us" => "films#contact_us"
      get "not_published" => "films#not_published"
      get "films/search" => "films#search", :as => "search_film"
      get "blog" => "films#blog", :as => "blog"
      get "history" => "films#history", :as => "history"
      get "support" => "films#support", :as => "support"
      get "other" => "films#other"
    end
    member do
      get "show_modal" => "films#show_modal"
      put "like"=>"films#upvote"
      put "dislike"=>"films#downvote"
     
    end
  end
   get "films/get/:id" => "films#get", :as => "download_film"




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#all_film'

end
