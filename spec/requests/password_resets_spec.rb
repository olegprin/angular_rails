#require 'rails_helper'
require 'spec_helper'
RSpec.describe "PasswordResets", type: :request do
  it "emails user when registration" do
    user=Info.new(name: 'ddd', bio: "ccccc")
    user.valid?
    user.errors[:email].should_not be_empty
    #user=create(:user)
    #visit login_path
    #click_link "password"
    #fill_in "Email", with: user.email
    #click_button "Reset Password" 
  end
end
