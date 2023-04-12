require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'is invalid when it does not have name' do
    category = Category.create(name: "test")
    product = Product.new(description: "Hello", image:'World', price_cents:"9999", quantity: 99, category_id: category.id)
    expect(product).not_to be_valid 
  end

  it 'is invalid when it does not have price' do
    category = Category.create(name: "test")
    product = Product.new(name: "Orange Tree", description: "bleh", image:'duh', quantity: 30, category_id: category.id)
    expect(product).not_to be_valid 
  end
  
  it 'is invalid when it does not have quantity' do
    category = Category.create(name: "test")
    product = Product.new(name: "bazbew", description: "bazbewbewbew", image:'123', price_cents:"332211", category_id: category.id)
    expect(product).not_to be_valid 
  end

  it 'is invalid when it does not have category' do
    category = Category.create(name: "test")
    product = Product.new(name: "http", description: "fb", image:'123', price_cents:"3211", quantity: 22)
    expect(product).not_to be_valid 
  end

  it 'is valid when it has all required attributes' do
    category = Category.create(name: "test")
    product = Product.new(name: "qq", description: "gg", image:'wp', price_cents:"123321", quantity: 123, category_id: category.id)
    expect(product).to be_valid 
  end
end
