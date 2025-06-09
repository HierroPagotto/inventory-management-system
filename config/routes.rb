Rails.application.routes.draw do
  root 'produtos#index'
  
  resources :produtos do
    resources :movimentacoes, only: [:index, :new, :create]
  end
  
  resources :movimentacoes, only: [:index]
end
