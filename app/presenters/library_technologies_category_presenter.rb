class LibraryTechnologiesCategoryPresenter < PushType::Presenter
  def items
    super.map { |i| i.present!(helpers) }
  end
end
