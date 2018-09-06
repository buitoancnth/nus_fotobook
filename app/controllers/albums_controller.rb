class AlbumsController < ApplicationController
  layout 'layout_album_photo', only: :index
  before_action :load_image, only: :create

  def index
    @albums = Album.page params[:page]
  end

  def show
  end

  def update
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new album_params
    if @album.save
      @images.each do |image|
        @album.photos.create(image: image)
      end
      redirect_to albums_path
    else
      render :new
    end
  end

  def my_albums
    @albums = current_user.albums.page params[:page]
  end

  private
  def album_params
    params.require(:album).permit(:title, :description, :share_mode, :photos)
  end

  def load_image
    @images = params[:album][:images]
    return if @images
    redirect_to new_album_path
  end
end
