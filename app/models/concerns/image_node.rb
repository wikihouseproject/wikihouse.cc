module ImageNode
  extend ActiveSupport::Concern

  included do
    field :image_id, :asset,  validates: { presence: true }
  end

  def image_url
    image.file.url
  end
end
