Rails.application.routes.draw do
  get "/healthcheck", to: proc { [200, {}, ["Ok"]] }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :account_block do
    post '/accounts/account', to: 'account_block/accounts#create'
    # post '/accounts/email_otp', to: 'account_block/accounts#email_otp'
    # post '/accounts/send_otp', to: 'account_block/accounts/send_otps#create'
    # get '/accounts/email_confirmation', to: 'account_block/accounts/email_confirmations#show'
    # put '/accounts/email_confirmation', to: 'account_block/accounts/email_confirmations#update'
    # post '/accounts/sms_confirmation', to: 'account_block/accounts/sms_confirmations#create'
    put '/accounts/update', to: 'account_block/accounts#update'
    get '/accounts/index', to: 'account_block/accounts#index'
    delete '/accounts/delete', to: 'account_block/accounts#destroy'
    delete '/devices', to: 'account_block/accounts#destroy'
    post '/accounts/email_verification', to: 'account_block/accounts/email_verifications#email_verification'
    post '/accounts/resend_verification_email', to: 'account_block/accounts/resend_verification_emails#resend_verification_email'
    # post 'password/forgot', to: 'password#forgot'
    # post 'password/reset', to: 'password#reset'
  end

  namespace :bx_block_content_management do 
    resources :content_videos
  end

  namespace :bx_block_news_about_us do
    resources :news_about_us
   end

  namespace :bx_block_story do
    resources :companies
    resources :testimonials
    resources :stories
   end 

   namespace :bx_block_faq do
    resources :faq
   end

   namespace :bx_block_teams do
    resources :teams
   end

   namespace :bx_block_experiential_learning do
    resources :experientials
   end

   namespace :bx_block_forms do
    resources :forms
   end

   namespace :bx_block_banners do
    resources :banners
   end

   namespace :bx_block_address do
    resources :address
   end

   namespace :bx_block_bridgelabz_speak do
    resources :bridgelabz_speaks
  end

   namespace :bx_block_landingpage do
    post '/scholarships/scholar', to: 'scholarships#scholar'
    post '/scholarships/experience', to: 'scholarships#experience'
   end
end
