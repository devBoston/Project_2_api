require 'rails_helper'

RSpec.describe "Bonds", type: :request do
  describe "GET /bonds" do
    it "works! (now write some real specs)" do
      get bonds_path
      expect(response).to have_http_status(200)
    end
  end
end
