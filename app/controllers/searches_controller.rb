class SearchesController < ApplicationController
  
  respond_to :html, :js, :json

  def new
    @search = Search.new
    @categories=Film.uniq.pluck(:category)
    respond_modal_with  @search 
  end

  def search_film
    search_films
    render "show"
  end
 
  private
  
  def search_films
    film=Film.all

    @films=film.where(["title LIKE ?", params[:search][:title].titleize]) if  params[:search][:title].present?
    @films=film.where(["year LIKE ?", params[:search][:year].titleize]) if  params[:search][:year].present?
    @films=film.where(["language LIKE ?", params[:search][:language].titleize]) if  params[:search][:language].present?
    @films=film.where(["actor LIKE ?", params[:search][:actor].titleize]) if  params[:search][:actor].present?
    @films=film.where(["subtitle LIKE ?", params[:search][:subtitle].titleize]) if  params[:search][:subtitle].present?
    @films=@films.paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
  end
    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:title, :year, :actor, :language, :subtitle)
    end

end
