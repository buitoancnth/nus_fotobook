class AlbumsController < ApplicationController
  layout 'layout_album_photo', only: :index
  RECORD_PER_PAGE = 4
  before_action :load_album, only: [:edit, :show, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @albums = Album.shared.order_by_created_at.includes(:photos).search(params[:search]).page(params[:page]).per(RECORD_PER_PAGE)
  end

  def show
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      flash[:success] = t('messages.update_success')
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
      flash[:success] = t('messages.create_success')
      redirect_to my_albums_path
    else
      render :new
    end
  end

  def destroy
    @album.destroy
    flash[:success] = t('messages.delete_success')
    redirect_to my_albums_path
  end

  def my_albums
    @albums = current_user.albums.order_by_created_at.includes(:photos).page params[:page]
  end

  private
  def index_albums
    @albums = Album.shared.order_by_created_at.includes(:photos).page(params[:page]).per(4)
  end

  def album_params
    params.require(:album).permit(:title, :description, :share_mode, :images => [])
  end

  def load_album
    @album = Album.find params[:id]
  end
end
