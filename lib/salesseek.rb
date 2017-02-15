require 'rest-client'
require 'json'

class SalesSeek

  attr_accessor :email, :password, :client, :cookies

  def initialize
    self.email   = ENV.fetch('salesseek_email')
    self.password    = ENV.fetch('salesseek_pass')
    self.client  = ENV.fetch('salesseek_client_id')
  end

  def post kind='speaking_requests', object
    payload = build_payload(object).to_json
    cookies = login
    r = RestClient.post url_for("individuals"), payload, { cookies: cookies, content_type: :json }
    json = JSON.parse(r)

    group_id = ENV.fetch("salesseek_group_#{kind}")
    url = url_for("groups/#{group_id}/items/#{json['id']}")

    RestClient.put url, nil, {cookies: cookies}
  end

  private

    def login
      response = RestClient.post url_for("login"), { email_address: self.email, password: self.password }
      return response.cookies
    end

    # def new_post
    #   cookies = login
    #   r = RestClient.post url_for("individuals"), self.salesseek_payload.to_json, { cookies: cookies, content_type: :json }
    #   json = JSON.parse(r)
    #   p json
    # end

    def url_for path
      url = "https://#{client}.salesseek.net/api"
      [url, path].join("/")
    end

    def build_payload o
      {
        first_name: o.first_name,
        last_name: o.last_name,
        organization: {name: o.data['organisation']},
        roles: [{title: o.data['role']}],
        comments: "Automatically added via enquiry form",
        communication: [
          {
            medium: "email",
            value: o.email
          }
        ]
      }
    end

  # def salesseek_payload
  #   {
  #     first_name: "",
  #     last_name: "",
  #     group: "",
  #     organization: {name: ""},
  #     roles: [{title: ""}],
  #     comments: "Automatically added via enquiry form",
  #     communication: [
  #       {
  #         medium: "email",
  #         value: ""
  #       }
  #     ]
  #     # locations: [{
  #     #   name: "Office",
  #     #   address: "United Kingdom"
  #     # }]
  #   }
  # end

end
