Boxy::Application.routes.draw do
  resources :rooms do
    resources :devices
  end
end
