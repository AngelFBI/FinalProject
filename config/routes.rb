# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  resources :lists, shallow: true do
    resources :tasks
    get 'tasks/:id/justification', to: 'tasks/justification#edit',
                                   as: 'justification'
  end
end
