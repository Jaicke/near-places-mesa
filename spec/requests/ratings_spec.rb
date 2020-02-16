require 'rails_helper'

RSpec.describe "Ratings requests", type: :request do
	let(:place) { create(:place) }

	context "when not logged" do
		describe "GET /index" do
			it "responds with status 401" do
				get api_v1_place_ratings_path(place_id: place.id)
				expect(response).to have_http_status(:unauthorized)
			end
		end

		describe "POST /create" do
			let(:rating) { attributes_for(:rating) }

			it "responds with 401" do
				post api_v1_place_ratings_path(place_id: place.id), params: { rating: rating }
				expect(response).to have_http_status(:unauthorized)
			end
		end
	end

	context "when logged" do
		let(:user) { create(:user) }
		let(:authentication_token) { { "Authorization": user.authentication_token } }

		describe "GET /index" do
			it "responds with status 200" do
				get api_v1_place_ratings_path(place_id: place.id), headers: authentication_token
				expect(response).to have_http_status(:ok)
			end
		end

		describe "POST /create" do
			context "when fail" do
				let(:rating) { { rating: { comment: ""} } }

				before do
					post api_v1_place_ratings_path(place_id: place.id), params: rating, headers: authentication_token
				end

				it "responds with status 422" do
					expect(response).to have_http_status(:unprocessable_entity)
				end
			end

			context "when success" do
				let(:rating) { attributes_for(:rating) }

				before do
					post api_v1_place_ratings_path(place_id: place.id), params: { rating: rating }, headers: authentication_token
				end

				it "responds with status 201" do
					expect(response).to have_http_status(:created)
				end
			end
		end
	end
end