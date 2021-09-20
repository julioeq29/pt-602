Rails.application.routes.draw do
  # Landing
  root to: 'pages#the_batch'
  # Pages
  resources :pages, only: :show
  # get :the_batch, to: 'pages#the_batch'
  get :the_students, to: 'pages#the_students'
  get :the_projects, to: 'pages#the_projects'
  get :the_TAs,      to: 'pages#the_TAs'
  get :the_staff,    to: 'pages#the_staff'
  get :the_numbers,  to: 'pages#the_numbers'
  get :final_note,   to: 'pages#final_note'
end
