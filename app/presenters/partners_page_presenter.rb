class PartnersPagePresenter < PushType::Presenter
  def tiles
    super.map { |t| TilePresenter.new(t, helpers) }
  end
end
