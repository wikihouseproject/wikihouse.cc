require 'rest-client'
require 'json'

class SalesSeek

  attr_accessor :email, :password, :client, :cookies

  def initialize
    self.email    = ENV.fetch('sales_seek_email')
    self.password = ENV.fetch('sales_seek_pass')
    self.client   = ENV.fetch('sales_seek_client_id')
  end

  def post kind, object
    payload = build_payload(object).to_json

    # get cookie from login request
    cookies = login

    # create a new SalesSeek Invidividual
    r = RestClient.post url_for("individuals"), payload, {
      cookies: cookies,
      content_type: :json
    }
    json = JSON.parse(r)

    # add the new Individual to the correct group
    group_id = ENV.fetch("sales_seek_group_#{kind}")
    url = url_for("groups/#{group_id}/items/#{json['id']}")

    RestClient.put url, nil, {cookies: cookies}
  end

  private

    def login
      response = RestClient.post url_for("login"), {
        email_address: self.email,
        password: self.password
      }
      return response.cookies
    end

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
        ],
        custom_fields: {
          ENV.fetch('sales_seek_priority_proposal_custom_field_id') => o.priority_proposal?.to_s
        }
      }
    end

end
