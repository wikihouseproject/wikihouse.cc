Rails.application.routes.draw do

  %w(about donate
    terms message_received).each do |page|
      get page.gsub("_","-"), to: "static##{page}", as: page
  end

  get 'jobs', to: redirect("https://www.opensystemslab.io/jobs")

  resources :enquiries, path: 'contact-us' do
    get 'preview', on: :member
  end

  # We used to have URLs with uppercase letters in, e.g. /library/types/Microhouse
  # This redirects them to the lowercase equivalent, since PushType's node lookup
  # is case-sensitive.
  get "/library/*path", to: redirect { |params, request| "/library/#{params[:path].downcase}" },
      constraints: { path: /.*[[:upper:]].*/ }

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
