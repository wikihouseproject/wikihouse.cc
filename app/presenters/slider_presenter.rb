class SliderPresenter < PushType::Presenter
  def class_name
    "dark" if dark_text
  end

  def formatted_title
    h.safe_join(title.split("\\"), "<br>".html_safe)
  end

  def style
    "background-image: url('#{image_url}'); " +
      "background-position: #{image_position_horizontal} #{image_position_vertical}"
  end
end
