class CategoriesController < ApplicationController

  def show
    @categories_count = Category.count
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end
puts "categories_count: #{@categories_count} categories"
end
