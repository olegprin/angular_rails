require 'rails_helper'

RSpec.describe "Angulars", type: :request do
  describe "GET /angulars" do
    it "works! (now write some real specs)" do
      get angulars_path
      expect(response).to have_http_status(200)
    end
  end
end
