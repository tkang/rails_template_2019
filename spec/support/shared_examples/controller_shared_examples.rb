require 'rails_helper'

RSpec.shared_examples "login page redirection" do
	it { expect(subject.status).to be(302) }
	it { expect(subject).to redirect_to(new_user_session_path) }
end

RSpec.shared_examples "root page redirection" do
	it { expect(subject.status).to be(302) }
	it { expect(subject).to redirect_to(root_path) }
end

RSpec.shared_examples "show page" do
	it { expect(subject.status).to be(200) }
	it { expect(subject).to render_template(:show) }
end

RSpec.shared_examples "index page" do
	it { expect(subject.status).to be(200) }
	it { expect(subject).to render_template(:index) }
end
