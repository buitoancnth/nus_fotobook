class Admin::AlbumsController < ApplicationController
  layout "admin_layout"
  before_action :admin_user
  before_action :load_album, only: [:edit, :update, :destroy]

  def index
    @albums = Album.order_by_created_at.includes(:photos).page params[:page]
  end

  def update
    if @album.update_attributes(album_params)
      flash[:success] = t('messages.update_success')
      redirect_to admin_albums_path
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    flash[:success] = t('messages.delete_success')
    redirect_to admin_albums_path
  end

  private
  def album_params
    params.require(:album).permit(:title, :description, :share_mode, :images => [])
  end

  def load_album
    @album = Album.find params[:id]
  end
end
