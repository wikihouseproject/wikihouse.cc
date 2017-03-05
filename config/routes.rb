Rails.application.routes.draw do

  %w(about donate communities_guide community
    technologies tools about_wikihouse_foundation
    prospectus terms message_received jobs).each do |page|
      get page.gsub("_","-"), to: "static##{page}", as: page
  end

  get 'library/technologies/:id', to: 'things#index'
  get 'library/technologies/:kind/:id', to: 'things#show'

  resources :library_categories, path: 'library' do
    resources :things, path: ''
  end
  resources :enquiries, path: 'contact-us' do
    get 'preview', on: :member
  end

  # Mount all the registered PushType Rails Engines. This should be placed
  # at the end of your routes.rb file to ensure your application routes are
  # not overidden by PushType.
  #
  # Overide the default mount points by passing a hash of options.
  # Example:
  #
  #   mount_push_type admin: 'cms', front_end: 'blog'
  #
  mount_push_type
end
