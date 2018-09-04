class AlbumsController < ApplicationController
  layout 'layout_album_photo', only: :index

  def index
    @albums = Album.page params[:page]
  end

  def show
  end

  def update
  end

  def my_albums
    @albums = current_user.albums.page params[:page]
    render :index
  end
end
