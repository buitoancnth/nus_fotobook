class AlbumsController < ApplicationController
  layout 'layout_album_photo', only: :index
  before_action :load_album, only: [:edit, :show, :update, :destroy]

  def index
    @albums = Album.album_public.order_by_created_at.page params[:page]
  end

  def show
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      redirect_to my_albums_path
    else
      render :edit
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new album_params
    if @album.save
      redirect_to my_albums_path
    else
      render :new
    end
  end

  def destroy
    @album.destroy
    flash[:success] = "deleted success !"
    redirect_to my_albums_path
  end

  def my_albums
    @albums = current_user.albums.includes(:photos).page params[:page]
  end

  private
  def album_params
    params.require(:album).permit(:title, :description, :share_mode, :images => [])
  end

  def load_album
    @album = Album.find params[:id]
  end
end
