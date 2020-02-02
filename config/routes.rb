# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # same with declaring 7 controllers (index, show, new, create, edit, update, destroy)
  # 1. GET /posts matches the posts #index action
  # 2. GET /posts/new matches the posts#new action
  # 3. GET /posts/:id matches the posts#show action
  # 4. GET /posts/:id/edit matches the posts#edit action
  # 5. POST /posts matches the posts#create action
  # 6. PATCH or PUT /posts/:id matches the posts#update action
  # 7. DELETE /posts/:id matches the posts#destroy action
  resources :posts do
    get 'published', on: :collection
    get 'draft', on: :collection
  end
  # manual example1 > get '/posts',          to: 'posts#index'
  # manual example2 > delete '/posts/:id',  to: 'posts#destroy'

  get '/blogs', to: 'blogs#index'
end
