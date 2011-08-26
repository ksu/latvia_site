::Refinery::Application.routes.draw do
  resources :questions, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :questions, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
