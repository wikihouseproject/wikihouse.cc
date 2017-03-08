class LibraryTechnologiesSubcategoryPresenter < PushType::Presenter
  def link_to_unless_empty(content)
    if items.any?
      h.link_to content, h.node_path(self)
    else
      content
    end
  end

  def css_class
    "technology-full-width" if full_width_image
  end

  def style
    "background-color: #{color}"
  end
end
