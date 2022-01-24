require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "will save successfully" do
      @product = Product.new
      @category = Category.new
      @product.name = 'test'
      @product.price = 12345
      @product.quantity = 5
      @product.category = @category
      @product.save
      expect(@product.id).to be_present
    end

    it "validates name" do
      @product = Product.new
      @category = Category.new
      @product.price = 12345
      @product.quantity = 5
      @product.category = @category
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates price" do
      @product = Product.new
      @category = Category.new
      @product.name = 'test'
      @product.quantity = 5
      @product.category = @category
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "validates quantity" do
      @product = Product.new
      @category = Category.new
      @product.name = 'test'
      @product.price = 12345
      @product.category = @category
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates category" do
      @product = Product.new
      @product.name = 'test'
      @product.price = 12345
      @product.quantity = 5
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

