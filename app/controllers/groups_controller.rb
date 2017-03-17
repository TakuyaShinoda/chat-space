class GroupsController < ApplicationController

  before_action :set_group, only: %i( edit update )
  before_action :move_to_index, only: :edit

  def index
    @groups = current_user.groups.desc
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  def edit; end

  def update
    @group.update(group_params)
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def move_to_index
    group_ids = current_user.groups.pluck(:id)
    redirect_to groups_path if group_ids.exclude?(params[:id].to_i)
  end

end
