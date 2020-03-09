require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do 

    it 'should save when given all fields' do
      @category = Category.new(name: 'yeezies')
      @category.save
      @product = Product.new(
        name: 'the newest',
        description: "mah shoes",
        category_id: @category.id,
        quantity: 50,
        image: "any",
        price: 50)
      @product.save!

      expect(@product.id).to be_present
    end

    it 'should give an error when a category is not present' do 
      @category = Category.new(name: 'yeezies')
      @category.save
      @product = Product.new(
        name: "sho",
        description: "mah shoes",
        quantity: 50,
        image: "any",
        price: 50)
      @product.save

      expect(@product.errors.full_messages).to eql(["Category can't be blank"])
    end


    it 'should give an error when a quantity is not present' do 
      @category = Category.new(name: 'yeezies')
      @category.save
      @product = Product.new(
        name: "sho",
        description: "mah shoes",
        category_id: @category.id,
        image: "any",
        price: 50)
      @product.save

      expect(@product.errors.full_messages).to eql(["Quantity can't be blank"])
    end


    it 'should give an error when a price is not present' do 
      @category = Category.new(name: 'yeezies')
      @category.save
      @product = Product.new(
        name: "sho",
        description: "mah shoes",
        category_id: @category.id,
        quantity: 50,
        image: "any")
      @product.save

      expect(@product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end


    it 'should give an error when a name is not present' do 
      @category = Category.new(name: 'yeezies')
      @category.save
      @product = Product.new(
        description: "mah shoes",
        category_id: @category.id,
        quantity: 50,
        image: "any",
        price: 50)
      @product.save

      expect(@product.errors.full_messages).to eql(["Name can't be blank"])
    end

  end

end
