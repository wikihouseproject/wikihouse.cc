require 'sales_seek'

class EnquirySalesSeekWorker
  attr_accessor :enquiry_id, :kind

  def initialize(kind, enquiry_id)
    self.enquiry_id = enquiry_id
    self.kind = kind
  end

  def perform
    enquiry = Enquiry.find(enquiry_id)
    SalesSeek.new.post(kind, enquiry)
  end

end
