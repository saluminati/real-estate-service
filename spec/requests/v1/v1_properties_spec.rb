require 'rails_helper'

RSpec.describe 'V1::Properties', type: :request do
    before(:all) do
        @property = FactoryBot.create(:v1_property, user_id:1)
        @token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTY4OTYzNzIsInN1YiI6MX0.r4Rl5sSBZ0NyrDXdCWoCGDIYQlvBbiH8eez0xQVlbBY'
    end

    def token_get(token)
        {
            'Authorization': "Bearer #{token}",
            'Content-Type':'application/json',
            'Accept': 'application/json'
        }
    end

    describe 'GET /v1_properties' do
        it 'returns list of properties for current_user' do
            get v1_properties_path, headers: token_get(@token)
            expect(response).to have_http_status(:success)
            json = JSON.parse(response.body)
            expect(json.length).to be >= 1
        end

        it 'return 401 http status if the token is invalid' do
          get v1_properties_path, headers: token_get('someinvalidtoken')
          expect(response).to have_http_status(401)
        end
    end

    describe 'POST /v1_properties' do

      it 'creates a property for the current_user' do
        property_params = FactoryBot.attributes_for(:v1_property, user_id:nil)
        post v1_properties_path, headers: token_get(@token), params:{"v1_property"=> property_params}.to_json
        expect(response).to have_http_status(:success)
      end

      context "if title, decsription, state, post_code or street_address is not valid or empty" do

        it "returns return 422 - Unprocessable status " do
          property_params = FactoryBot.attributes_for(:v1_property, user_id:nil,title:nil, description:nil, street_address:nil, post_code:nil)
          post v1_properties_path, headers: token_get(@token), params:{"v1_property"=> property_params}.to_json
          result = JSON.parse(response.body)

          expect(response).to have_http_status(422)
          expect(result['title']).to include("can't be blank")
          expect(result['title']).to include("is too short (minimum is 5 characters)")
          expect(result['description']).to include("can't be blank")
          expect(result['description']).to include("is too short (minimum is 20 characters)")
          expect(result['street_address']).to include("can't be blank")
          expect(result['street_address']).to include("is too short (minimum is 10 characters)")
          expect(result['post_code']).to include("is the wrong length (should be 4 characters)")
          expect(result['post_code']).to include("can't be blank")
        end

      end

    end

    describe 'PUT /v1_properties' do

      it 'allows the property to be updated' do
        @property.title = 'this is updated title'
        put "#{v1_properties_path}/#{@property.id}", headers: token_get(@token), params:{"v1_property"=> @property.attributes}.to_json
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(result['title']).to include("this is updated title")
      end

      context "if title, decsription, state, post_code or street_address is not valid or empty" do

        it "returns return 422 - Unprocessable status " do
          @property.title = @property.description = @property.post_code = @property.street_address = nil
          put "#{v1_properties_path}/#{@property.id}", headers: token_get(@token), params:{"v1_property"=> @property.attributes}.to_json
          result = JSON.parse(response.body)

          expect(response).to have_http_status(422)
          expect(result['title']).to include("can't be blank")
          expect(result['title']).to include("is too short (minimum is 5 characters)")
          expect(result['description']).to include("can't be blank")
          expect(result['description']).to include("is too short (minimum is 20 characters)")
          expect(result['street_address']).to include("can't be blank")
          expect(result['street_address']).to include("is too short (minimum is 10 characters)")
          expect(result['post_code']).to include("is the wrong length (should be 4 characters)")
          expect(result['post_code']).to include("can't be blank")
        end

      end

    end

end
