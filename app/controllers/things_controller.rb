class ThingsController < ApplicationController

  def index
    @products = Product.includes(:repos).order(ordinal: :asc)
    if request.path == "/library/technologies"
      render "static/technologies"
    else
      params[:library_category_id] ||= 'technologies'
      @repos = Repo.where(kind: params[:library_category_id].singularize.capitalize)
      if params[:id].present?
        @repos = @repos.where(sub_kind: params[:id])
      end
    end
  end

  def show
    repos = Repo.where("LOWER(name) = ?", params[:id].downcase)

    @breadcrumbs = []
    split_path = request.path.split("/").reject(&:blank?)
    split_path.each_with_index do |crumb, index|
      @breadcrumbs.push([crumb.capitalize, ['',split_path[0..index]].flatten.join("/") ])
    end

    if repos.length > 0
      @repo = repos.first
      @breadcrumbs.last[0] = @repo.name
    else
      redirect_to library_categories_path
    end
  end

end
