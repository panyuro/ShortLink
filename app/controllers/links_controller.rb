class LinksController < ApplicationController

  def create
    shortener = Shortener.new(link_params[:origin_url])
    @link = shortener.generate_short_link

    if @link.persisted?
      respond_to :js
    else
      render 'error.js.erb'
    end
  end

  def show
    @link = Link.find_by(lookup_code: params[:lookup_code])
    redirect_to @link.origin_url
  end

  private
  def link_params
    params.require(:link).permit(:origin_url)
  end
end