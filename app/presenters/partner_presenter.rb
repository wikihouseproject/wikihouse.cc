class PartnerPresenter < PushType::Presenter
  def linked_image
    if link.blank?
      image_tag
    else
      h.link_to(image_tag, link)
    end
  end

  def image_tag
    h.image_tag image_url, alt: title
  end
end
