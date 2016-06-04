require 'rails_helper'


describe Info do
  it "emails user when registration" do
    user=Film.new(title: '')
    user.valid?
    user.errors[:title].should_not be_empty
    #user=create(:user)
    #visit login_path
    #click_link "password"
    #fill_in "Email", with: user.email
    #click_button "Reset Password" 
  end
end
