ActionMailer::Base.smtp_settings={
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "oleg.prin@gmail.com",
      :password             => "marazm999",
      :authentication       => :plain,
      :enable_starttls_auto => true


}



 ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default charset: "utf-8"