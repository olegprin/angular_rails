class HomeController < ApplicationController

  def index

  end

  def search
    @films = Film.where(send_new_film: false).search_everywhere(params[:query]).paginate(:page => params[:page], :per_page => Configurable[:blogs_per_page])
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag)
    end
  end  
  
  def search_tags
     @films = Film.where(send_new_film: false).search_everywhere(params[:tag]).paginate(:page => params[:page], :per_page => Configurable[:blogs_per_page])
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag)
    end
    render "home/all_film"
  end
    
  def all_film
    @films = Film.where(send_new_film: false).paginate(:page => params[:page], :per_page => Configurable[:blogs_per_page])
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag)
    end
    @resourse='Film'
    @active='current'
    render "home/all_film"
  end	

end
