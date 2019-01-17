require 'rails_helper'

describe S3SigningsController do
  it { expect(get: '/s3_signings').to route_to(controller: "s3_signings", action: "index") }
end
