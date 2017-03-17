require 'rails_helper'

describe MessagesController, type: :controller do

  before do
    login_user
  end

  let(:user) { create(:user) }
  let(:group) { create(:group, ) }

    describe 'GET #index' do

      it "populates an array of messages orderd by created_at ASC" do
        messages = create_list(:message, 3, group_id: group.id)
        get :index, group_id: group
        expect(assigns(:messages)).to match(messages.sort{ |a, b| a.created_at <=> b.created_at })
      end

      it "assings the requested group to @group" do
        get :index, group_id: group
        expect(assigns(:group)).to eq group
      end

      it "renders the :index template" do
        get :index, group_id: group
        expect(response).to render_template :index
      end

    describe 'POST #create' do

      it "saves the new contact in the database" do
        expect {
        post :create, group_id: group, message: attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it "doesn't save the new contact inthe database without body" do
        expect {
        post :create, group_id: group, message: attributes_for(:message, body: "")
        }.not_to change(Message, :count)
      end

      it "renders the group_messages_path template" do
        post :create, group_id: group, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path
      end
    end
  end
end
