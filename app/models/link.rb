class Link < ApplicationRecord
  validates_presence_of :origin_url, :lookup_code
  validates_uniqueness_of :lookup_code
end
