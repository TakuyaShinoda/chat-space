class MessagesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :move_to_index, only: %i( index create )
  before_action :set_group, only: %i( index create )

  def index
    @groups = current_user.groups.desc
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      redirect_to group_messages_path, alert: 'メッセージが投稿できません。'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def move_to_index
    group_ids = current_user.groups.pluck(:id)
    redirect_to groups_path if group_ids.exclude?(params[:group_id].to_i)
  end

end
