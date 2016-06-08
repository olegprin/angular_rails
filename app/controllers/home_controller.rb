class HomeController < ApplicationController

  def index

  end

  def search
    @films = Film.can_publish_searchs(params[:query]).paginate(:page => params[:page], :per_page => Configurable[:blogs_per_page])
    set_parameters
  end  
  
  def search_tags
    @films = Film.can_publish_search(params[:tag]).paginate(:page => params[:page], :per_page => Configurable[:blogs_per_page])
    set_parameters
    render "home/all_film"
  end
    
  def all_film
    @films = Film.can_publish_sort.paginate(:page => params[:page], :per_page => Configurable['blogs_per_page'])
    set_parameters
    @resourse='Film'
    @active='current'
    render "home/all_film"
  end	

  def set_parameters
    @films_down=@films.sample(4)
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag).sample(5)
    end
  end
  
end
