require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'is valid if it has orgin_url and lookup_code' do
    link = Link.new(
      origin_url: 'https://github.com/rspec/rspec-rails',
      lookup_code: '123456'
    )
    expect(link.valid?).to be(true)
  end

  it 'is valid if the origin_url not formatted properly ' do
    link = Link.new(
      origin_url: 'jdskhfkhfeh',
      lookup_code: '123456'
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if it not have orgin_url' do
    link = Link.new(
      origin_url: 'https://github.com/rspec/rspec-rails'
    )
    expect(link.valid?).to be(false)
  end

  it 'is valid if it not have orgin_url' do
    link = Link.new(
      lookup_code: '123456'
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if it has same lookup_code' do
    link_1 = Link.new(
      origin_url: 'https://github.com/rspec/rspec-rails/url1',
      lookup_code: '123456'
    )
    link_1.save

    link_2 = Link.new(
      origin_url: 'https://github.com/rspec/rspec-rails/url2',
      lookup_code: '123456'
    )

    expect(link_2.valid?).to be(false)
  end
end
