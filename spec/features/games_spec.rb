require 'rails_helper'

RSpec.feature "Games", type: :feature do
  before do
    @my_team = FactoryBot.create(:team)
  end

  scenario 'user creates a new game', js: true do
    user = FactoryBot.create(:user)

    # TOPページからログインする
    visit root_path
    click_link t(:log_in)
    fill_in :name, with: user.name
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button t(:helpers)[:submit][:submit]

    expect {
      # 管理者メニュー画面から、新規試合登録画面に遷移すること
      expect(page).to have_content t(:users)[:admin][:title]
      click_link t(:new_game)
      expect(page).to have_content t(:games)[:new][:title]

      # 必要項目を入力し、新規試合登録が出来ること
      fill_in :date,   with: Time.zone.now
      fill_in :ground, with: '松原小学校'
      select '先攻', from: :bat_first

      find(".team_top    > input[type='text']").set('シルバー')
      find(".team_bottom > input[type='text']").set('ゴーゴー')

      7.times do |i|
        fill_in "top_of_#{(i + 1).ordinalize}",    with: rand(0..10)
        fill_in "bottom_of_#{(i + 1).ordinalize}", with: rand(0..10)
      end

      fill_in t(:helpers)[:label][:game][:overview], with: 'いい試合だった。'

      click_button t(:helpers)[:submit][:create]
      expect(page).to have_content t(:games)[:create][:success]
    }.to change(@my_team.games, :count).by(1)
  end
end