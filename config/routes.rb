Rails.application.routes.draw do
  resources :expenses
  resources :users

  resources :ledger_balance
  resources :settlement
  resources :balance_sheet_history

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
