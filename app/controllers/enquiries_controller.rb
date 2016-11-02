class EnquiriesController < ApplicationController

  before_action :set_filenames

  def index
    redirect_to enquiry_path(@filenames[0].gsub("_","-"))
  end

  def show
    redirect_to enquiries_path unless @filenames.include?(params[:id].gsub("-","_"))
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    unless @enquiry.save
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
