class EnquiriesController < ApplicationController

  before_action :set_filenames
  invisible_captcha only: [:create], honeypot: :subtitle

  def index
    redirect_to enquiry_path(@filenames[0].gsub("_","-"))
  end

  def show
    redirect_to enquiries_path unless @filenames.include?(params[:id].gsub("-","_"))
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      notifier = Slack::Notifier.new ENV.fetch('slack_webhook_url')
      notifier.ping "#{@enquiry.first_name}",
        icon_emoji: ':wikihouse:',
        username: @enquiry.kind,
        attachments: [{
          fallback: "Fallback",
          pretext: @enquiry.message,
          # author_name: [@enquiry.first_name],
          # title: @enquiry.kind,
          # text: @enquiry.message,
          fields: @enquiry.data.map{|k,v| { title: k, value: (v.kind_of?(Array) ? v.join(", ") : v) }}
        }]
      render json: @enquiry.to_json
    else
      redirect_to :back
    end
  end

  private

    def enquiry_params
      params.require(:enquiry).permit!
    end

    def set_filenames
      files = Dir.glob("app/views/enquiries/partials/*.html.erb").sort
      files = files.insert(-1, files.delete_at(files.index('app/views/enquiries/partials/_something_else.html.erb')) )
      @filenames = files.map{|f| File.basename(f, ".html.erb")[1..-1] }
    end
end
