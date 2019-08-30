require 'rails_helper'
require 'webmock/rspec'

RSpec.describe UsersController, type: :controller do
  let(:regular_user) { users(:one) }
  let(:admin_user) { users(:two) }

  describe 'GET#index' do
    context 'when the request comes from and admin account' do
      before do
        get :index

        body = JSON.parse(response.body)
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status 200
      end

      it "JSON body response contains all the users" do
        json_response = JSON.parse(response.body)
        expect(body.keys).to match_array([:id, :name, :email, :role_id])
      end
    end

    context 'when the request comes from a regular account' do
      it 'displays only the requesting user information' do
      end
    end
  end

  describe 'PUT#update' do
    context 'if the user is an admin' do
      it 'updates the record' do
      end
    end

    context 'if the user is a regular user' do
      it 'returns an error' do
      end
    end
  end
end