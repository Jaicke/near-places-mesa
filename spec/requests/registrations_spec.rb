require 'rails_helper'

RSpec.describe "Registration requests", type: :request do
  describe "POST /create" do
    context "when fail" do
      let(:fields) { { user: { email: ""} } }

      before do
        post api_v1_registrations_path, params: fields
      end

      it "returns with status 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when success" do
      let(:profile_attributes) { attributes_for(:profile) }
      let(:user) {  attributes_for(:user, profile_attributes: profile_attributes)  }

      before do
        post api_v1_registrations_path, params: { user: user }
      end

      it "returns with status 201" do
        expect(response).to have_http_status(:created)
      end
    end
  end

end