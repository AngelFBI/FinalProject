# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  resources :tasks
  resources :lists
  get 'tasks/:id/justification', to: 'tasks/justification#edit',
                                 as: 'justification'
end
