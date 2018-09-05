class AlbumsController < ApplicationController
  layout 'layout_album_photo', only: :index

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
      if params[:images]
          params[:images].each do |image|
            @album.photos.create(image: image)
          end
        redirect_to albums_path
      end
    else
      render :new
    end
  end

  def my_albums
    @albums = current_user.albums.page params[:page]
    # render :index
  end

  private
  def album_params
    params.require(:album).permit(:title, :description, :share_mode, :photos)
  end
end
