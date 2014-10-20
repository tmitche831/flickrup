class PhotosController < ApplicationController

  rescue_from Flickr::ApiError, with: :render_not_found

  def index
    unless params[:q].blank?
      @photos = Flickr.photos.search({text: params[:q]}.merge(pagination_params))
    else
      @photos = [].paginate pagination_params
    end
  end

  def show
    @photo = Flickr.photos.find(params[:id])
  ensure
    @photo.get_info! # Triggers ApiError for non-existant IDs
  end

  private

  def pagination_params
    { page: params[:page], per_page: 140 }
  end

  def render_not_found
    render nothing: true, status: 404
  end

end
