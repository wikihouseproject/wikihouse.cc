module SliderHostPresenter
  def sliders
    super.map { |s| SliderPresenter.new(s, helpers) }
  end
end
