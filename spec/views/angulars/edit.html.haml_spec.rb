require 'rails_helper'

RSpec.describe "angulars/edit", type: :view do
  before(:each) do
    @angular = assign(:angular, Angular.create!(
      :title => "MyString",
      :body => "MyString"
    ))
  end

  it "renders the edit angular form" do
    render

    assert_select "form[action=?][method=?]", angular_path(@angular), "post" do

      assert_select "input#angular_title[name=?]", "angular[title]"

      assert_select "input#angular_body[name=?]", "angular[body]"
    end
  end
end
