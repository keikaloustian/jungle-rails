require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "saves a product successfully when all fields are provided" do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: @category,
        quantity: 8,
        price: 12
      )
      expect(@product).to be_valid
    end

    it "does not save a product if a name isn't provided" do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: nil,
        description: "This is a test",
        category: @category,
        quantity: 2,
        price: 60
      )
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "does not save a product if a price isn't provided" do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: @category,
        quantity: 2,
        price: ''
      )
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "does not save a product if a quantity isn't provided" do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: @category,
        quantity: nil,
        price: 18
      )
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "does not save a product if a category isn't provided" do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: nil,
        quantity: 2,
        price: 3
      )
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
      expect(@product.errors.full_messages).to include("Category must exist")
    end

  end

end
