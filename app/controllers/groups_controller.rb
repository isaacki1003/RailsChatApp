class GroupsController < ApplicationController
    def index
      @groups = Group.all
    end

    def new
      @group = Group.new
    end

    def show
        @group = Group.find_by(id: params[:id])

        if @group.nil?
          flash[:error] = "Group not found"
          redirect_to groups_path
        end
      end

    def create
      @group = Group.new(group_params)

      if @group.save
        redirect_to groups_path, notice: "Group was successfully created."
      else
        render :new
      end
    end

    private

    def group_params
      params.require(:group).permit(:name)
    end
  end
