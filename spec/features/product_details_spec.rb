require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |i|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(3),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg'),
      )
    end
  end

  scenario 'They click on a product link' do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    expect(page).to have_css 'article.product', count: 10
    find('a.btn-default', match: :first).click
    sleep 5
    save_screenshot
  end
end
