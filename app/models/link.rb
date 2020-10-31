class Link < ApplicationRecord
  validates_presence_of :origin_url, :lookup_code
  validates_uniqueness_of :lookup_code
  validate :origin_url_format

  def origin_url_format
    url = URI.parse(origin_url || '')
    errors.add :origin_url, 'Invalid url format' if url.host.nil?
  end

  def shortened_url
    "http://localhost:3000/#{lookup_code}"
  end
end
