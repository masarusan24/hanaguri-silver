require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before do
    @team = FactoryBot.create(:team)
  end

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
        @user = FactoryBot.create(:user, :as_admin)
        @game = FactoryBot.create(:game, :with_score)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :show, params: { id: @game.id }
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @game = FactoryBot.create(:game, :with_score)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :show, params: { id: @game.id }
        expect(response).to be_success
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @game = FactoryBot.create(:game, :with_score)
      end

      # (ログインなしでも)正常にレスポンスを返すこと
      it 'responds successfully without sign-in' do
        get :show, params: { id: @game.id }
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

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        sign_in @user
        get :new
        expect(response).to be_success
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
        @game = FactoryBot.create(:game, :with_score)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        game_params = FactoryBot.attributes_for(:game)
        sign_in @user
        get :edit, params: { id: @game.id, game: game_params }
        expect(response).to be_success
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @game = FactoryBot.create(:game, :with_score)
      end

      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        game_params = FactoryBot.attributes_for(:game)
        sign_in @user
        get :edit, params: { id: @game.id, game: game_params }
        expect(response).to be_success
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @game = FactoryBot.create(:game, :with_score)
      end

      # 302レスポンスを返すこと
      it 'returns 302 response' do
        game_params = FactoryBot.attributes_for(:game)
        get :edit, params: { id: @game.id, game: game_params }
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
        # 試合が作成出来ること
        it 'adds a game' do
          game_params  = FactoryBot.attributes_for(:game)
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          expect {
            post :create, params: { game: game_params, score: score_params }
          }.to change(Game, :count).by(1)
        end
      end

      # 無効な属性値の場合
      context 'with invalid attributes' do
        # 試合が作成出来ないこと
        it 'does not add a game' do
          game_params  = FactoryBot.attributes_for(:game, :invalid_game)
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          expect {
            post :create, params: { game: game_params, score: score_params }
          }.to_not change(Game, :count)
        end
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      # 有効な属性値の場合
      context 'with valid attributes' do
        # 試合が作成出来ること
        it 'adds a game' do
          game_params  = FactoryBot.attributes_for(:game)
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          expect {
            post :create, params: { game: game_params, score: score_params }
          }.to change(Game, :count).by(1)
        end
      end

      # 無効な属性値の場合
      context 'with invalid attributes' do
        # 試合が作成出来ないこと
        it 'does not add a game' do
          game_params  = FactoryBot.attributes_for(:game, :invalid_game)
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          expect {
            post :create, params: { game: game_params, score: score_params }
          }.to_not change(Game, :count)
        end
      end
    end

    # ゲストとして
    context 'as a guest' do
      # 302レスポンスを返すこと
      it 'returns 302 response' do
        game_params  = FactoryBot.attributes_for(:game)
        score_params = FactoryBot.attributes_for(:score)
        post :create, params: { game: game_params, score: score_params }
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#update' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
        @game = FactoryBot.create(:game, team_top: 'Old team_top')
        @score = FactoryBot.create(:score)
      end

      # 有効な属性値の場合
      context 'with valid attributes' do
        # 試合情報を更新出来ること
        it 'updates a game' do
          game_params = FactoryBot.attributes_for(
            :game,
            team_top: 'New team_top'
          )
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          patch :update, params: { id: @game.id, game: game_params, score: score_params }
          expect(@game.reload.team_top).to eq 'New team_top'
        end
      end

      # 無効な属性値の場合
      context 'with invalid attributes' do
        # 試合情報を更新出来ないこと
        it 'does not update a game' do
          game_params  = FactoryBot.attributes_for(:game, :without_team_top)
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          patch :update, params: { id: @game.id, game: game_params, score: score_params }
          expect(@game.reload.team_top).to eq 'Old team_top'
        end
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @game = FactoryBot.create(:game, team_top: 'Old team_top')
      end

      # 有効な属性値の場合
      context 'with valid atributes' do
        # 試合情報を更新出来ること
        it 'updates a game' do
          game_params = FactoryBot.attributes_for(
            :game,
            team_top: 'New team_top'
          )
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          patch :update, params: { id: @game.id, game: game_params, score: score_params }
          expect(@game.reload.team_top).to eq 'New team_top'
        end
      end

      # 無効な属性値の場合
      context 'with invalid attributes' do
        # 試合情報を更新出来ないこと
        it 'does not update a game' do
          game_params = FactoryBot.attributes_for(:game, :without_team_top)
          score_params = FactoryBot.attributes_for(:score)
          sign_in @user
          patch :update, params: { id: @game.id, game: game_params, score: score_params }
          expect(@game.reload.team_top).to eq 'Old team_top'
        end
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @game = FactoryBot.create(:game, :with_score)
      end

      # 302レスポンスを返すこと
      it 'returns 302response' do
        game_params  = FactoryBot.attributes_for(:game)
        score_params = FactoryBot.attributes_for(:score)
        patch :update, params: { id: @game.id, game: game_params, score: score_params }
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#destroy' do
    # Adminユーザとして
    context 'as an administrator' do
      before do
        @user = FactoryBot.create(:user, :as_admin)
        @game = FactoryBot.create(:game)
      end

      # 試合情報を削除出来ること
      it 'deletes a game' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @game.id }
        }.to change(Game, :count).by(-1)
      end
    end

    # 一般管理者として
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @game = FactoryBot.create(:game)
      end

      # 試合情報を削除出来ること
      it 'deletes a game' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @game.id }
        }.to change(Game, :count).by(-1)
      end
    end

    # ゲストとして
    context 'as a guest' do
      before do
        @game = FactoryBot.create(:game)
      end

      # 試合情報を削除出来ないこと
      it 'does not delete a game' do
        expect {
          delete :destroy, params: { id: @game.id }
        }.to_not change(Game, :count)
      end
    end
  end
end
