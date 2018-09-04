require 'rails_helper'

describe HomeController do
  it { expect(get: '/').to route_to(controller: "home", action: "index") }
end
