class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def count
    @products_count = Product.count
    puts "Products count: #{@products_count} products"
  end
  
end
