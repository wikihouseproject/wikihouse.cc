class ThingsController < ApplicationController
  
  def index
    if (params[:library_category_id] == "technologies")
      render "static/technologies"
    else
      @repos = Repo.where(kind: params[:library_category_id].singularize.capitalize)
    end
  end

  def show
    repos = Repo.where("LOWER(name) = ?", params[:id].downcase)
    if repos.length > 0
      @repo = repos.first
    else
      redirect_to library_categories_path
    end
  end

end
