class PhotosController < ApplicationController
  layout 'layout_album_photo', only: :index

  def index
    @photos = Photo.page params[:page]
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def update
  end

  def create
    @photo = current_user.photos.new photo_params
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def my_photos
    @photos = current_user.photos.page params[:page]
    # render :index
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image, :share_mode)
  end
end
