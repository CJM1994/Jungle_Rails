require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations, presence: true' do

    it 'saves successfully if all filled out' do
      category = Category.create!(name: 'apparel')
      product = category.products.create!({ 
        name:  'Test Hat',
        description: 'text',
        quantity: 4,
        price: 34.49
       })
    end
    it 'validates name' do
      category = Category.create!(name: 'apparel')
      product = category.products.create({ 
        description: 'text',
        quantity: 4,
        price: 34.49
       })
       expect(product).to_not be_valid
    end
    it 'validates price' do
      category = Category.create!(name: 'apparel')
      product = category.products.create({ 
        name: 'Test Hat',
        description: 'text',
        quantity: 4
       })
       expect(product).to_not be_valid
    end
    it 'validates category' do
      product = Product.create({ 
        name: 'Test Hat',
        description: 'text',
        quantity: 4,
        price: 34.49
       })
       expect(product).to_not be_valid
    end
    it 'validates quantity' do
      category = Category.create!(name: 'apparel')
      product = category.products.create({ 
        name:  'Test Hat',
        description: 'text',
        price: 34.49
       })
       expect(product).to_not be_valid
    end

  end
end
