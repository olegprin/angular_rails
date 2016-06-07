class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
 
  before_action :set_latest
  helper_method :user_present?
  helper_method :role?
  helper_method :current_blog
  helper_method :only_admin_or_moderator

    
  def only_admin_or_moderator
    if user_signed_in? && current_user.admin==true
      true
    else
      redirect_to root_path  
    end
  end
  
   def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end
  
  def current_author_coment(comment)
    if current_user.present?  
      current_user.comments.each do |comm|
        return true if comment.id==comm.id
      end
      false
    else
      false
    end
  end  

  def set_latest
    @films_latest = Film.where(send_new_film: false).order('created_at DESC').sample(Configurable.latest_per_page) 
    @films_random = Film.where(send_new_film: false).take(Configurable['random_per_page']) 
  end    

  rescue_from Cinema::NotFound do
    render_404
  end

  rescue_from Cinema::InvalidAccess do
    render_404
  end

  rescue_from Cinema::ReadOnly do
    render_404
  end

  def user_present?
    current_user.present?
  end
  
  def role?(role)
    if current_user.role==role.to_s
      return true
    else
      return false
    end  
  end

  def render_404  
    respond_to do |format|  
      format.html { render :file => "#{Rails.root}/public/404.html", :status => '404 Not Found' }  
      format.xml  { render :nothing => true, :status => '404 Not Found' }  
    end  
    true  
  end
  
  def only_admin
    if user_present?
      current_user.admin==true ? true : (redirect_to root_path)  
    else
      redirect_to root_path  
    end 
  end 
  

  def user_created_article?
    if current_user.present?
      current_user.films.where(id: @film.id).present?
    end
  end

  private

    def current_author_for_object(method, object)  
      if user_present? 
        if method==object.id
          return true 
        else
          false        
        end
      else
        false 
      end 
    end


end
