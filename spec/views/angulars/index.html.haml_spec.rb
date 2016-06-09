require 'rails_helper'

RSpec.describe "angulars/index", type: :view do
  before(:each) do
    assign(:angulars, [
      Angular.create!(
        :title => "Title",
        :body => "Body"
      ),
      Angular.create!(
        :title => "Title",
        :body => "Body"
      )
    ])
  end

  it "renders a list of angulars" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
