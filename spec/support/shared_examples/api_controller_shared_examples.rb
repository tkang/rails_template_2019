require 'rails_helper'

RSpec.shared_examples "requires authentication" do
	it { expect(subject.status).to be(401) }
  it do
    errors = JSON.parse(subject.body)['errors']
    expect(errors).to eq(["You need to sign in or sign up before continuing."])
  end
end

RSpec.shared_examples "returns json data" do
	it { expect(subject.status).to be(200) }
	it do
    json = JSON.parse(subject.body).map(&:deep_symbolize_keys)
    expect(json).to eq(expected_json)
  end
end
