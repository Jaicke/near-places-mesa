require 'rails_helper'

RSpec.describe "Users requests", type: :request do

  context "when not logged" do
    describe "GET /index" do
      it "responds with status 401" do
        get api_v1_users_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe "PATCH /update" do
      it "responds with 401" do
        patch api_v1_users_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context "when logged" do
    let(:user) { create(:user) }
    let(:authentication_token) { { "Authorization": user.authentication_token } }

    describe "GET /index" do
      it "responds with status 200" do
        get api_v1_users_path, headers: authentication_token
        expect(response).to have_http_status(:ok)
      end
    end

    describe "PATCH /update" do
      context "when fail" do
        let(:fields) { { user: { email: ""} } }

        before do
          patch api_v1_users_path, params: fields, headers: authentication_token
        end

        it "responds with status 422" do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context "when success" do
        let(:fields) { { user: { email: "teste2@mesa.inc"} } }

        before do
          patch api_v1_users_path, params: fields, headers: authentication_token
        end

        it "responds with status 200" do
          expect(response).to have_http_status(:ok)
        end
      end
    end
    
  end
end