Rails.application.routes.draw do
  root to: 'queries#index'

  mount GovukAdminTemplate::Engine, at: '/style-guide'
end
