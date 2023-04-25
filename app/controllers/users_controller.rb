class UsersController < ApplicationController
    # GET /users
    def index
        @users = User.all
    end

    def show
        # Find the user by ID and set it to @user instance variable
        @user = User.find(params[:id])
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
    end

    # POST /users
    def create
        @user = User.new(user_params)

        if @user.save
        redirect_to @user, notice: 'User was successfully created.'
        else
        render :new
        end
    end

    # PATCH/PUT /users/1
    def update
        @user = User.find(params[:id])
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
