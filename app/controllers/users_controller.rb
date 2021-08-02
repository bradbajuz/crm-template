class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @users = pagy(User.where(role: [:supervisor, :manager, :tech, :unassigned, :disabled]).where.not(id: 2)
                             .order(:role, id: :asc), items: 10)
    authorize(@users)
  end

  def show
    authorize(@user)

    if current_user.manager? && @user.supervisor?
      respond_to do |format|
        format.html { redirect_to(users_path, flash: { error: 'Unauthorized' }) }
      end
    end
  end

  def edit
    authorize(@user)
    @minimum_password_length = User.password_length.min

    if current_user.manager? && @user.supervisor?
      respond_to do |format|
        format.html { redirect_to(users_path, flash: { error: 'Unauthorized' }) }
      end
    end
  end

  def update
    authorize(@user)
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to(users_path, notice: 'User was successfully updated.') }
      else
        format.html { render(:edit) }
      end
    end
  end

  def destroy
    name = @user.name
    authorize(@user)
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to(users_path, notice: "\"#{name}\" was deleted successfully.") }
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
