class RssController < ApplicationController


  def feed
    @posts = Film.order(created_at: :desc)
      respond_to do |format|
        format.rss { render :layout => false }
    end
  end

  def sitemap
    respond_to do |format|
      format.xml { render file: 'public/sitemaps/sitemap.xml' }
      format.html { redirect_to root_url }
    end
  end

  def robots
  	@posts = Film.where(send_new_film: false)
  end

end
