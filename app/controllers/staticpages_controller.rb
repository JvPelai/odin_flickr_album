class StaticpagesController < ApplicationController
  def index
    flicker = Flickr.new(ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"])
    if !params[:flickr_id].nil?
      person = Flickr.people.find(params[:flickr_id])
      @photos = person.public_photos(sizes: true).map(&:medium500!)
    end
  end

  def search_params
    params.require(:staticpages).permit(:flickr_id)
  end
end