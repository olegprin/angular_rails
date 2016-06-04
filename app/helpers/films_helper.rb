module FilmsHelper
  
  def email(film)
	User.find(film.user_id)
  end	

  def user_email(film)
    Info.find_by_user_id(film.user_id)
  end 
  
  def picture_user(comment)
    begin
      user=User.find(comment.user_id)
      @info=user.info.photo
      return @info
    rescue ActiveRecord::RecordNotFound  
       @info="/assets/userpic.gif" 
      return @info
    end  
  end 	

end
  
