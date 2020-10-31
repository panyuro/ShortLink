class LinksController < ApplicationController

  def create
    shortener = Shortener.new(link_params[:origin_url])
    @link = shortener.generate_short_link
  end

  def link_params
    params.require(:link).permit(:origin_url)
  end
end