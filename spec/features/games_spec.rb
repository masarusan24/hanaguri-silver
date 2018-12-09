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

    # 管理者メニュー画面に遷移すること
    expect(page).to have_content t(:users)[:admin][:title]
    click_link t(:new_game)

    # 新規試合登録画面に遷移すること
    expect(page).to have_content t(:games)[:new][:title]
  end
end