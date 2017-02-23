module SliderHost
  def sliders
    children.published.where(type: Slider)
  end
end
