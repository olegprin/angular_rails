class AdminMailer < ApplicationMailer

  def send_admin_about_user
    admin=User.where(admin: true)
    if admin.present?
      admin.pluck(:email)
    end 
  end


   
  def new_user(user)
  	 @user=user
  	 mail(to: @user.email, subject: "  You: #{user.email} was registered! Welcome")
  end 



   def new_user_admin(user)
     @user=user
  	 mail(to: send_admin_about_user, subject: " User: #{user.email} was registered to our sites!!!!")
   end 

end

