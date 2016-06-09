require "rails_helper"

RSpec.describe AngularsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/angulars").to route_to("angulars#index")
    end

    it "routes to #new" do
      expect(:get => "/angulars/new").to route_to("angulars#new")
    end

    it "routes to #show" do
      expect(:get => "/angulars/1").to route_to("angulars#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/angulars/1/edit").to route_to("angulars#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/angulars").to route_to("angulars#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/angulars/1").to route_to("angulars#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/angulars/1").to route_to("angulars#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/angulars/1").to route_to("angulars#destroy", :id => "1")
    end

  end
end
