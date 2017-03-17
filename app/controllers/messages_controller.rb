class MessagesController < ApplicationController
  before_action :set_group, only: %i( index create )

  def index
    @groups = current_user.groups.desc
    @messages = @group.messages.asc
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

end
