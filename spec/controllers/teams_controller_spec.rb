require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
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
      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        get :index
        expect(response).to be_success
      end
    end
  end

  describe '#show' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
        @team = FactoryBot.create(:team)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :show, params: { team_short_name: @team.team_short_name }
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :show, params: { team_short_name: @team.team_short_name }
        expect(response).to be_success
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @team = FactoryBot.create(:team)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        get :show, params: { team_short_name: @team.team_short_name }
        expect(response).to be_success
      end
    end
  end

  describe '#new' do
    # Adminユーザとして
    context 'as an administorator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :new
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      # 302レスポンスを返すこと
      it 'returns 302 response' do
        sign_in @user
        get :new
        expect(response).to have_http_status '302'
      end
    end

    # ゲストとして
    context 'as a guest' do
      # 302レスポンスを返すこと
      it 'returns 302 response' do
        get :new
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#edit' do
    # Adminユーザとして
    context 'as an administorator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
        @team = FactoryBot.create(:team)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        team_params = FactoryBot.attributes_for(:team)
        sign_in @user
        get :edit, params: { team_short_name: @team.team_short_name, team: team_params }
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team)
      end

      # 302レスポンスを返すこと
      it 'returns 302 response' do
        team_params = FactoryBot.attributes_for(:team)
        sign_in @user
        get :edit, params: { team_short_name: @team.team_short_name, team: team_params }
        expect(response).to have_http_status '302'
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @team = FactoryBot.create(:team)
      end

      # 302レスポンスを返すこと
      it 'returns 302 response' do
        team_params = FactoryBot.attributes_for(:team)
        get :edit, params: { team_short_name: @team.team_short_name, team: team_params }
        expect(response).to have_http_status '302'
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

      # 有効な属性値の場合
      context 'with valid attributes' do
        # チームが作成出来ること
        it 'adds a team' do
          team_params = FactoryBot.attributes_for(:team)
          sign_in @user
          expect {
            post :create, params: { team: team_params }
          }.to change(Team, :count).by(1)
        end
      end

      # 無効な属性値の場合
      context 'with invalid attributes' do
        # チームが作成出来ないこと
        it 'does not add a team' do
          team_params = FactoryBot.attributes_for(:team, :invalid_team)
          sign_in @user
          expect {
            post :create, params: { team: team_params }
          }.to_not change(Team, :count)
        end
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      # 302レスポンスを返すこと
      it 'returns 302 response' do
        team_params = FactoryBot.attributes_for(:team)
        sign_in @user
        post :create, params: { team: team_params }
        expect(response).to have_http_status '302'
      end
    end

    # ゲストとして
    context 'as a guest' do
      # 302レスポンスを返すこと
      it 'returns 302 response' do
        team_params = FactoryBot.attributes_for(:team)
        post :create, params: { team: team_params }
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#update' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
        @team = FactoryBot.create(:team, team_name: 'Old Team Name')
      end

      # 有効な属性値の場合
      context 'with valid atributes' do
        # チーム情報を更新出来ること
        it 'updates a team' do
          team_params = FactoryBot.attributes_for(
            :team,
            team_name: 'New Team Name'
          )
          sign_in @user
          patch :update, params: { team_short_name: @team.team_short_name, team: team_params }
          expect(@team.reload.team_name).to eq 'New Team Name'
        end
      end

      # 無効な属性値の場合
      context 'with invalid attributes' do
        # チーム情報を更新出来ないこと
        it 'does not update a team' do
          team_params = FactoryBot.attributes_for(:team, :invalid_team)
          sign_in @user
          patch :update, params: { team_short_name: @team.team_short_name, team: team_params }
          expect(@team.reload.team_name).to eq 'Old Team Name'
        end
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team, team_name: 'Old Team Name')
      end

      # チーム情報を更新出来ないこと
      it 'does not update team' do
        team_params = FactoryBot.attributes_for(
          :team,
          team_team_short_name: 'New Team Name'
        )
        sign_in @user
        patch :update, params: { team_short_name: @team.team_short_name, team: team_params }
        expect(@team.reload.team_name).to eq 'Old Team Name'
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @team = FactoryBot.create(:team)
      end

      # NoMethodErrorを返すこと
      it 'returns NoMethodError' do
        team_params = FactoryBot.attributes_for(:team)
        expect {
          patch :update, params: { team_short_name: @team.team_short_name, team: team_params }
        }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#destroy' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
        @team = FactoryBot.create(:team)
      end

      # チーム情報を削除出来ること
      it 'deletes a team' do
        sign_in @user
        expect {
          delete :destroy, params: { team_short_name: @team.team_short_name }
        }.to change(Team, :count).by(-1)
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @team = FactoryBot.create(:team)
      end

      # チーム情報を削除出来ないこと
      it 'does not delete a team' do
        sign_in @user
        expect {
          delete :destroy, params: { team_short_name: @team.team_short_name }
        }.to_not change(Team, :count)
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @team = FactoryBot.create(:team)
      end

      # チーム情報を削除出来ないこと
      it 'does not delete a team' do
        expect {
          delete :destroy, params: { team_short_name: @team.team_short_name }
        }.to_not change(Team, :count)
      end
    end
  end
end
