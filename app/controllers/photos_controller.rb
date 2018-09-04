class PhotosController < ApplicationController
  layout 'layout_album_photo', only: :index

  def index
    @photos = Photo.page params[:page]
  end

  def show
  end

  def update
  end

  def my_photos
    @photos = current_user.photos.page params[:page]
    # render :index
  end
end
