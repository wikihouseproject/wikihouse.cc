require 'rest-client'
require 'json'

class SalesSeek

  attr_accessor :email, :password, :client, :cookies

  CATEGORIES = {
    'student_enquiry' => ENV.fetch('salesseek_students'),
    'providers' => ENV.fetch('salesseek_providers'),
    'speaking_requests' => ENV.fetch('salesseek_speaking_requests'),
    'job_enquiries' => ENV.fetch('salesseek_job_enquiries'),
    'press' => ENV.fetch('salesseek_press')
  }

  def initialize
    self.email   = ENV.fetch('salesseek_email')
    self.password    = ENV.fetch('salesseek_pass')
    self.client  = ENV.fetch('salesseek_client_id')
  end

  def login
    response = RestClient.post url_for("login"), { email_address: self.email, password: self.password }
    return response.cookies
  end

  def post type='speaking_requests', payload=salesseek_payload
    cookies = login
    r = RestClient.post url_for("individuals"), payload.to_json, { cookies: cookies, content_type: :json }
    json = JSON.parse(r)
    url = url_for("groups/#{CATEGORIES[type]}/items/#{json['id']}")
    p url
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
