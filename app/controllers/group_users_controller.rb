class GroupUsersController < ApplicationController
    def index
      @group = Group.find(params[:group_id])
      @group_users = @group.group_users
    end

    def create
      @group = Group.find(params[:group_id])
      @user = User.find(params[:user_id])
      @group_user = GroupUser.new(group_id: @group.id, user_id: @user.id)

      if @group_user.save
        redirect_to @group, notice: "User added to group successfully."
      else
        flash.now[:alert] = "Error adding user to group."
        render :new
      end
    end



    def destroy
      @group_user = GroupUser.find(params[:id])
      @group = @group_user.group

      if @group_user.destroy
        redirect_to group_group_users_path(@group), notice: "Group user was successfully removed."
      else
        redirect_to group_group_users_path(@group), alert: "Unable to remove group user."
      end
    end

    private

    def group_user_params
      params.require(:group_user).permit(:user_id)
    end
  end
