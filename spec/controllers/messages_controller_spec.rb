require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:member) { create(:member)}

  describe 'GET #index' do
    context "when user login" do

      before do
        login_user user
      end

      it "assigns the requested group to @group" do
        group = create(:group)
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested messages to @messages" do
        messages = create_list(:message, 3, group: group)
        get :index, params: { group_id: group}
        expect(assigns(:messages)).to eq messages
      end

      it "renders the :index template" do
        get :index, params: { group_id: group}
        expect(response).to render_template :index
      end
    end

    context "when user not login" do
      it "redirect_to new_user_session_path" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context "when user login and successed saving message" do

      before do
        login_user user
      end

        it "saved in the database" do
          expect{ post :create, params: { group_id: group, message: attributes_for(:message) } }.to change(Message, :count).by(1)
        end

        it "renders the :index template" do
          get :index, params: { group_id: group}
          expect(response).to render_template :index
        end
    end

    context "when user login and failed saving message" do

      before do
        login_user user
      end
        it "not saved in the database" do
          expect{ post :create, params: { group_id: group, message: attributes_for(:message, text: nil, image: nil) }}.to change(Message, :count).by(0)
        end

        it "renders the :index template" do
          get :index, params: { group_id: group}
          expect(response).to render_template :index
        end
    end

    context "when user not login" do
      it "redirect_to new_user_session_path" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

