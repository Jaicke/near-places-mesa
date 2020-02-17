require 'rails_helper'

RSpec.describe "Session requests", type: :request do
  let(:user) { create(:user) }

  describe "POST /create" do
    context "when login fails" do
      let(:fields) { { user: { email: user.email, password: "wrongpassword" } } }

      before do
        post api_v1_sessions_path, params: fields
      end

      it "returns with status 401" do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when login has success" do
      let(:fields) { { user: { email: user.email, password: user.password} } }

      before do
        post api_v1_sessions_path, params: fields
      end

      it "returns with status 200" do
        expect(response).to have_http_status(:ok)
      end
    end
  end

end