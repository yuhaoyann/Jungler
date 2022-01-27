require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  
  before :each do
    User.create!(
      name: 'test',
      email: 'test@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

    end
  end

  scenario "They see all products" do

    visit root_path

    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with:'password'
    click_button('Submit')
    expect(page).to have_content('Signed in as')

    expect(page).to have_css 'article.product', count: 10
    
    save_and_open_screenshot
  end
end