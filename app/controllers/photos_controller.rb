class PhotosController < ApplicationController
  layout 'layout_album_photo', only: :index
  before_action :load_photo, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @photos = Photo.shared.image_not_in_album.order_by_created_at.search(params[:search]).page(params[:page]).per(4)
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def update
    if @photo.update_attributes(photo_params)
      flash[:success] = t('messages.update_success')
      redirect_to my_photos_path
    else
      render :edit
    end
  end

  def create
    @photo = current_user.photos.new photo_params
    if @photo.save
      flash[:success] = t('messages.create_success')
      redirect_to my_photos_path
    else
      render :new
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = t('messages.delete_success')
    redirect_to my_photos_path
  end

  def my_photos
    @photos = current_user.photos.order_by_created_at.page params[:page]
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image, :share_mode)
  end

  def load_photo
    @photo = Photo.find params[:id]
  end
end
