require 'rails_helper'

RSpec.describe 'Link Redirection', type: :request do
  it 'redirects to the original URL for a given short Link' do
    url = 'https://www.bootcdn.cn/'
    shortener = Shortener.new (url)
    link = shortener.generate_short_link

    get link.shortened_url
    expect(response).to redirect_to url
  end

end
