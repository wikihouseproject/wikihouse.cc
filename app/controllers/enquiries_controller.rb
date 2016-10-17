class EnquiriesController < ApplicationController

  before_action :set_filenames

  def index
    redirect_to enquiry_path('becoming-a-partner')
  end

  def show
    redirect_to enquiries_path unless @filenames.include?(params[:id].gsub("-","_"))
  end

  private

    def set_filenames
      files = Dir.glob("app/views/enquiries/partials/*.html.erb")
      @filenames = files.map{|f| File.basename(f, ".html.erb")[1..-1] }
    end
end
