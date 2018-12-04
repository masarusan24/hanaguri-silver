require 'rails_helper'

RSpec.feature "Games", type: :feature do
  scenario 'user creates a new game' do
    user = FactoryBot.create(:user)

    visit admin_menu_path
    # TODO: Capybara::ElementNotFoundが発生
    click_link t(:new_game)
  end
end
