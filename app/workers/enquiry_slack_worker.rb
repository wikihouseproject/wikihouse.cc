class EnquirySlackWorker
  attr_accessor :enquiry_id

  def initialize(enquiry_id)
    self.enquiry_id = enquiry_id
  end

  def perform
    enquiry = Enquiry.find(enquiry_id)

    notifier = Slack::Notifier.new ENV.fetch('slack_webhook_url')
    notifier.ping "#{enquiry.first_name}",
      icon_emoji: ':wikihouse:',
      username: enquiry.kind,
      attachments: [{
        fallback: "Fallback",
        pretext: enquiry.data['message'],
        # author_name: [enquiry.first_name],
        # title: enquiry.kind,
        # text: enquiry.data['message'],
        fields: enquiry.data.map{|k,v| { title: k, value: (v.kind_of?(Array) ? v.join(", ") : v) }}
      }]
  end
end
