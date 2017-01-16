require 'rest-client'
require 'json'

class SalesSeek

  attr_accessor :email, :password, :client, :cookies

  def initialize
    self.email   = ENV.fetch('salesseek_email')
    self.password    = ENV.fetch('salesseek_pass')
    self.client  = ENV.fetch('salesseek_client_id')
  end

  def login
    response = RestClient.post url_for("login"), { email_address: self.email, password: self.password }
    return response.cookies
  end

  def new_post
    cookies = login
    r = RestClient.post url_for("individuals"), self.salesseek_payload.to_json, { cookies: cookies, content_type: :json }
    json = JSON.parse(r)
    p json
  end

  def post type='speaking_requests', payload=salesseek_payload
    cookies = login
    r = RestClient.post url_for("individuals"), payload.to_json, { cookies: cookies, content_type: :json }
    json = JSON.parse(r)

    group_id = ENV.fetch("salesseek_group_#{type}")
    url = url_for("groups/#{group_id}/items/#{json['id']}")

    RestClient.put url, nil, {cookies: cookies}
  end

  def url_for path
    url = "https://#{client}.salesseek.net/api"
    [url, path].join("/")
  end

  def salesseek_payload
    {
      first_name: "John",
      last_name: "Rees",
      group: "Students",
      organization: {name: 'Bitsushi'},
      roles: [{title: "Developer"}],
      comments: "Automatically added via enquiry form",
      communication: [
        {
          medium: "email",
          value: "john@wikihouse.cc"
        }
      ]
      # locations: [{
      #   name: "Office",
      #   address: "United Kingdom"
      # }]
    }
  end

end
