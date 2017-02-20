require 'rails_helper'

describe MessagesController, :type => :controller do

  before do
    @user = create(:user)
    sign_in @user
  end

  after do
  	sign_out @user
  end

  describe 'GET #index' do
  	it "renders the :index template" do
  	end
  end

end