P4::Application.routes.draw do
  
  resources :experiments do
	resources :meta_tags, :comments
  end

  devise_for :users do
	resources :experiments
  end
  
  match "experiments/:id" => "experiments#show"
  
  root :to => "experiments#index"

end
