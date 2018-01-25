require 'rails_helper'

RSpec.describe V1::ConnectionHelper, type: :helper do

  context "Upon providing a valid token" do
    it "sends the token to Auth Micro Service and then returns [user_id, status_code]" do
      output = helper.validate_token('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTY4OTYzNzIsInN1YiI6MX0.r4Rl5sSBZ0NyrDXdCWoCGDIYQlvBbiH8eez0xQVlbBY')
      expect(output).to include(1)
      expect(output).to include("200")
    end
  end

  context "Upon providing an invalid token" do
    it "sends the token to Auth Micro Service and then returns [nil, status_code]" do
      output = helper.validate_token('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9')
      expect(output).to include(nil)
      expect(output).to include("401")
    end
  end

end
