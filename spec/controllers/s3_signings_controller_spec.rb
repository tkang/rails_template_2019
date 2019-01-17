require 'rails_helper'

describe S3SigningsController, "GET #index" do
  it do
    get :index
    expect(response.status).to eq(200)
		json = JSON.parse(response.body)
		expect(json.keys).to eq(['signedUrl'])
  end
end
