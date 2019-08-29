class UsersController < ApplicationController

  before_action :authenticate_user_from_token!
  load_and_authorize_resource

  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.find(current_user.id)
    end

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    # def set_user
    #   @user = User.find(params[:id])
    # end

    def user_params
      params.require(:user)
      .permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :role_id
      )
    end
end
