class FilmsController < ApplicationController


  before_action :authenticate_user!, :only => [:blog, :edit, :new, :create, :update,:destroy, :not_published]    
  before_action :set_film, only: [:show_modal,:get, :upload, :show, :edit, :update, :destroy, :upvote, :downvote ]
  before_action :define_eccept, only: [:edit, :update, :destroy]
  before_action :all_tags, only: [:show, :contact_us]
  #before_action :set_active, only: [:support, :active, :about_us, :contact_us, :blog]
  #before_action :cul_user, :except => [:show, :index]  
 
  respond_to :html, :js, :json
  # GET /films
  # GET /films.json
  def index
    @films = Film.where(send_new_film: false).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end 
  # GET /films/1
  # GET /films/1.json
  def show
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag).sample(5)
    end
    
    @user=User.find(@film.user_id)
    @info=@user.info
    
      @commentable=@film
   @comment_count=@commentable.comments.paginate(
       :page => params[:page],
       :per_page => Configurable[:blogs_per_page]
    )
  
      respond_to do |format|
        format.html
        format.pdf {send_data @film.receipt.render, filename: "#{@film.title}-receipt.pdf", type: "application/pdf", disposition: :attachment}
      end
  end

  def search
    @search=params[:search].titleize
    @films = Film.where(["title LIKE ?", @search]).paginate(:page => params[:page], :per_page => Configurable['blogs_per_page'])
    render "all_film"
  end  
  # GET /films/new
  def new
    @film = Film.new
   @film.tags.build
    @active="current"

  end
   
  # GET /films/1/edit
  def edit
     
  end
  
  def set_active
    @active="current"
  end
    
  def create
    @film = current_user.films.build(film_params)
    #@film.update_attributes(title: @film.title.titleize) #language: @film.language.titleize)
    
    respond_to do |format|
      if @film.save
        format.html { redirect_to film_path(@film), notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json {  }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        #@film.update_attributes(title: save_title(@film.title), language: save_title(@film.language), actor: save_title(@film.actor), subtitle: save_title(@film.subtitle))
        format.html { redirect_to film_path(@film), notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { redirect_to @film }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def support 
    @films = Film.where(["category LIKE ?", "Horror"]).paginate(:page => params[:page], :per_page => Configurable['blogs_per_page'])
    @active_support="current"
  end 

  def blog
    @films=current_user.films.where(send_new_film: false).paginate(:page => params[:page], :per_page => Configurable['blogs_per_page']) 
    @films_down=@films.sample(4)
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag).sample(5)
    end
    @active_blog="current"
  end 

  def not_published
    @films = Film.where(send_new_film: true).paginate(:page => params[:page], :per_page => Configurable['blogs_per_page'])
    
    @films_down=@films.sample(4)
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag).sample(5)
    end
    @active_about_us="current"
  end 
  
  def top_rated
    d=Voice.where('votable_type = ? AND vote_flag = ?', "Film", true)
      @a=d.order('sum_voices DESC')
   @films=[]
      @a.each do |c| 
      s=Film.find(c.votable_id)
        @films<<s
      
      end
      @films
    #@top_rated=params[:films][:top_rated]  
    #@films = Film.where(id: (Voice.where(["votable_type LIKE ?", "Film"])).id).paginate(:page => params[:page], :per_page => 8)
    render "all_film"
  end

  def other
    @films = Film.where(send_new_film: false).sample(Film.count).paginate(:page => params[:page], :per_page => Configurable['blogs_per_page'])
    @films_down=@films.sample(4)
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag).sample(5)
    end
    render "all_film"
  end

  def contact_us 
    @messagestoadministrator=Messagestoadministrator.new
    @active_contact_us="current"
  end  

  def get 
    if @film
      send_file @film.down_file.path, :type => @film.down_file_content_type 
    end
  end

 #def save_title(title)
  #  title.chomp.titleize
  #end

  
  private
  

  def all_tags
    @films = Film.where(send_new_film: false).paginate(:page => params[:page], :per_page => Configurable['blogs_per_page'])
    @films_down=@films.sample(4)
    all_tag=AllTag.first
    if all_tag.present?
      @all_tags=Array(all_tag.take_all_tag).sample(5)
    end
  end

  def define_eccept   
    if current_user.films.where(id: @film.id).present? || can_manage(current_user.films, @film, Film)
      return true
    else
      redirect_to root_path 
    end
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_film
      
      @film=Film.find_by_slug(params[:id]) 
      if @film.send_new_film==false
        @film
      elsif @film.send_new_film==true && user_created_article?
        @film
      elsif
         redirect_to root_path
      end   

  end

  
  # Never trust parameters from the scary internet, only allow the white list through.
  def film_params
    params.require(:film).permit(:send_new_film,:title, :description, :category, :actor, :subtitle, :language, :year,:image, :uploaded_file, :remove_image, :user_id, :down_file, :tags_attributes => [:id, :tag_type, :film_id])
  end

end
