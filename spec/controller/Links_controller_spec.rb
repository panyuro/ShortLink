require 'rails_helper'
RSpec.describe LinksController, type: :controller do
  it 'should shorten given url ' do
    url = 'https://github.com/rspec/rspec-rails'
    request.env["HTTP_ACCEPT"] = "text/javascript"
    post :create, params: {link: {origin_url: url}}
    link = assigns(:link)
    expect(link.origin_url).to eq(url)
    expect(link.valid?).to eq(true)
    expect(link.lookup_code.length).to eq(7)
    expect(link.persisted?).to eq(true)
    expect(response).to render_template('create')
  end
end
