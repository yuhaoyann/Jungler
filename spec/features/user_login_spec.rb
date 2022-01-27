# disable 'before_filter :authorize' in corresponding controller

require 'rails_helper'

RSpec.feature "user login", type: :feature, js: true do

  before :each do
    User.create!(
      name: 'test',
      email: 'test@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario "They can login" do

    visit root_path
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with:'password'
    click_button('Submit')
    expect(page).to have_content('Signed in as')

    save_screenshot
  end

end
