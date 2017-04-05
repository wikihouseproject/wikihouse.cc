class TilePresenter < PushType::Presenter
  def css_class
    "dark" if dark_text
  end

  def style
    styles = []

    if background_color.present?
      styles << "background-color: #{background_color}"
    end

    if background_image.present?
      styles << "background-image: url(#{background_image.file.url})"
    end

    styles.join(";")
  end
end
