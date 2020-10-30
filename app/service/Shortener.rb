class Shortener

  attr_reader :url

  def initialize(url)
    @url = url
  end

  # def lookup_code
  #   string = ''
  #   7.times do |n|
  #     string << (rand * n).round
  #   end
  #   string
  # end

  def lookup_code
    Digest::SHA256.hexdigest(url)[0..6]
  end
end