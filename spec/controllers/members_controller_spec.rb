require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe '#index' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :index
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :index
        expect(response).to be_success
      end
    end

    # ゲストとして
    context 'as a guest' do
      # (ログインなしでも)正常にレスポンスを返すこと
      it 'responds successfully without sign-in' do
        get :index
        expect(response).to be_success
      end
    end
  end

  describe '#show' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user   = FactoryBot.create(:user, :as_admin)
        @member = FactoryBot.create(:member)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :show, params: { name: @member.name }
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user   = FactoryBot.create(:user)
        @member = FactoryBot.create(:member)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :show, params: { name: @member.name }
        expect(response).to be_success
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @member = FactoryBot.create(:member)
      end

      # (ログインなしでも)正常にレスポンスを返すこと
      it 'responds successfully without sign-in' do
        get :show, params: { name: @member.name }
        expect(response).to be_success
      end
    end
  end

  describe '#create' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @team = FactoryBot.create(:team)
        @user = FactoryBot.create(:user, :as_admin)
      end

      # メンバーが作成出来ること
      it 'adds a member' do
        member_params = FactoryBot.attributes_for(:member)
        sign_in @user
        expect {
          post :create, params: { id: @team.id, member: member_params }
        }.to change(Member, :count).by(1)
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      # 302レスポンスを返すこと
      it 'returns 302 response' do
        member_params = FactoryBot.attributes_for(:member)
        sign_in @user
        post :create, params: { member: member_params }
        expect(response).to have_http_status '302'
      end
    end

    # ゲストとして
    context 'as a guest' do
      # 302レスポンスを返すこと
      it 'returns 302 response' do
        member_params = FactoryBot.attributes_for(:member)
        post :create, params: { member: member_params }
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#update' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user   = FactoryBot.create(:user, :as_admin)
        @member = FactoryBot.create(:member)
      end

      # メンバー情報を更新出来ること
      it 'updates a member' do
        member_params = FactoryBot.attributes_for(
          :member,
          full_name: 'New Member full_name'
        )
        sign_in @user
        patch :update, params: { name: @member.name, member: member_params }
        expect(@member.reload.full_name).to eq 'New Member full_name'
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user   = FactoryBot.create(:user)
        @member = FactoryBot.create(:member, full_name: 'Old Member full_name')
      end

      # メンバー情報を更新出来ないこと
      it 'does not update member' do
        member_params = FactoryBot.attributes_for(
          :member,
          full_name: 'New Member full_name'
        )
        sign_in @user
        patch :update, params: { name: @member.name, member: member_params }
        expect(@member.reload.name).to eq 'Old Member full_name'
      end
    end
    # ゲストとして
    context 'as a guest' do
      before do
        @member = FactoryBot.create(:member, full_name: 'Old Member full_name')
      end

      # メンバー情報を更新出来ないこと
      it 'does not update member' do
        member_params = FactoryBot.attributes_for(
          :member,
          full_name: 'New Member full_name'
        )
        patch :update, params: { name: @member.name, member: member_params }
        expect(@member.reload.name).to eq 'Ole Member full_name'
      end
    end
  end

  describe '#destroy' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user   = FactoryBot.create(:user, :as_admin)
        @member = FactoryBot.create(:member)
      end

      # メンバー情報を削除出来ること
      it 'deletes a member' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @member.id }
        }.to change(Member, :count).by(-1)
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      # メンバー情報を削除出来ないこと
      it 'does not delete a member' do
        sig_in @user
        expect {
          delete :destroy, params: { id: @member.id }
        }.to_not change(Member, :count)
      end
    end

    # ゲストとして
    context 'as a guest' do
      # メンバー情報を削除出来ないこと
      it 'does not delete a member' do
        expect {
          delete :destroy, params: { id: @member.id }
        }.to_not change(Member, :count)
      end
    end
  end
end
