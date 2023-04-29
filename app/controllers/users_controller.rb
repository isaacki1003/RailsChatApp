class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    def index
      @users = User.all
    end

    # GET /users/1
    def show
      # `@user` is already set by `set_user`
    end

    # GET /users/1/edit
    def edit
      # `@user` is already set by `set_user`
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :image, :other_user_info_columns)
    end
  end
