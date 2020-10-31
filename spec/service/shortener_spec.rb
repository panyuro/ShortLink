require 'rails_helper'

RSpec.describe Shortener do
  it 'shortens a given url to a 7 character look up code' do
    url = 'https://github.com/rspec/rspec-rails'
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it 'give each url its own look up code' do
    url = 'https://github.com/rspec/rspec-rails/-url1'
    shortener = Shortener.new(url)
    code1 = shortener.lookup_code

    url = 'https://github.com/rspec/rspec-rails/-url2'
    shortener = Shortener.new(url)
    code2 = shortener.lookup_code

    expect(code1).not_to eq(code2)
  end

  it 'generate a link record with a unique lookup code' do
    url = 'https://github.com/rspec/rspec-rails'
    shortener = Shortener.new(url)
    link1 = shortener.generate_short_link

    expect(link1.valid?).to be(true)

    link2 = shortener.generate_short_link
    expect(link2.valid?).to be(true)
  end
end