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
    end

  scenario "They see product details" do
    # ACT
    visit root_path

    # VERIFY
    find('a.btn-default').click

    expect(page).to have_content('Description')
    
    # DEBUG
    save_screenshot
    # another method to debug
    # puts page.html

  end

end
