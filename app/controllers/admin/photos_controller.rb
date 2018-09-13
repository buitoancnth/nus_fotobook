class Admin::PhotosController < ApplicationController
  layout "admin_layout"
  before_action :admin_user
  before_action :load_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.not_in_album.order_by_created_at.page params[:page]
  end

  def edit
  end

  def update
    if @photo.update_attributes(photo_params)
      flash[:success] = t('messages.update_success')
      redirect_to admin_photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = t('messages.delete_success')
    redirect_to admin_photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image, :share_mode)
  end

  def load_photo
    @photo = Photo.find params[:id]
  end
end
