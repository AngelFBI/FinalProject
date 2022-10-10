# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  shallow do
    resources :boards do
      resources :lists do
        resources :tasks
        get 'tasks/:id/justification', to: 'tasks/justification#edit',
                                       as: 'justification'
      end
    end
  end

  mount ActionCable.server, at: '/cable'
end
