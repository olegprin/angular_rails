require 'rails_helper'

RSpec.describe "angulars/new", type: :view do
  before(:each) do
    assign(:angular, Angular.new(
      :title => "MyString",
      :body => "MyString"
    ))
  end

  it "renders new angular form" do
    render

    assert_select "form[action=?][method=?]", angulars_path, "post" do

      assert_select "input#angular_title[name=?]", "angular[title]"

      assert_select "input#angular_body[name=?]", "angular[body]"
    end
  end
end
