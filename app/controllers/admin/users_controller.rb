class Admin::UsersController < ApplicationController
  layout "admin_layout"
  before_action :admin_user
  before_action :load_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order_by_created_at.page params[:page]
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t('messages.update_success')
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t('messages.delete_success')
    redirect_to admin_root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :is_active, :avatar)
  end

  def load_user
    @user = User.find params[:id]
  end
end
