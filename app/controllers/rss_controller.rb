class RssController < ApplicationController


  def feed
    @posts = Film.order(created_at: :desc)
      respond_to do |format|
        format.rss { render :layout => false }
    end
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", current_site.key, "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
  	@posts = Film.where(send_new_film: false)
  end

end
