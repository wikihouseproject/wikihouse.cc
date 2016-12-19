class ThingsController < ApplicationController
  
  def index
    if (params[:library_category_id] == "technologies")
      render "static/technologies"
    else
      @repos = Repo.where(kind: params[:library_category_id].singularize.capitalize)
    end
  end

  def show
    @repo = Repo.find_by(name: params[:id])
  end

end
