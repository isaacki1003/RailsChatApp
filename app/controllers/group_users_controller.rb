class GroupUsersController < ApplicationController
    # GET /groups/:group_id/group_users
    def index
        @group = Group.find(params[:group_id])
        @group_users = @group.group_users
        # Render view or return JSON as needed
    end

    # POST /groups/:group_id/group_users
    def create
        @group = Group.find(params[:group_id])
        @user = User.find(params[:user_id])
        @group_user = GroupUser.new(group: @group, user: @user)
        if @group_user.save
        # Handle successful creation, e.g., redirect or return JSON
        else
        # Handle validation errors or other failures
        end
    end

    # DELETE /groups/:group_id/group_users/:id
    def destroy
        @group_user = GroupUser.find(params[:id])
        @group_user.destroy
        # Handle successful deletion, e.g., redirect or return JSON
    end
end
