# /contact-us
class EnquiriesController < ApplicationController

  before_action :set_filenames
  invisible_captcha only: [:create], honeypot: :subtitle

  def index
    redirect_to enquiry_path(@filenames[0].gsub("_","-"))
  end

  def show
    redirect_to enquiries_path unless @filenames.include?(cleaned)
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)

    if @enquiry.save
      # email enquiry
      StaffMailer.delay.enquiry(@enquiry.id)
      # send contact to salesseek.net
      Delayed::Job.enqueue(EnquirySalesSeekWorker.new(cleaned(enquiry_params[:kind]), @enquiry.id))
      # add notification in slack
      Delayed::Job.enqueue(EnquirySlackWorker.new(@enquiry.id))

      respond_to do |format|
        format.html { redirect_to message_received_path }
        format.js
      end
    else
      redirect_to :back
    end
  end

  def preview
    @enquiry = Enquiry.find(params[:id])
    render :preview, layout: false
  end

  private

    def enquiry_params
      data_keys = params[:enquiry][:data].keys
      params.require(:enquiry).permit(:first_name, :last_name, :email, :kind, data: data_keys)
    end

    def set_filenames
      files = Dir.glob("app/views/enquiries/partials/*.html.erb").sort
      @filenames = files.map{|f| File.basename(f, ".html.erb")[1..-1] }
    end

    def cleaned dirty=params[:id]
      dirty.gsub("-","_").downcase.strip
    end
end
