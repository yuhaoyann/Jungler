# disable 'before_filter :authorize' in corresponding controller

require 'rails_helper'

RSpec.feature "click product will go to details page", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

      User.create!(
        name: 'test',
        email: 'test@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

  scenario "They see product details" do

    visit root_path

    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with:'password'
    click_button('Submit')
    expect(page).to have_content('Signed in as')

    find('a.btn-default').click

    expect(page).to have_content('Description')
    
    save_screenshot
  end

end
