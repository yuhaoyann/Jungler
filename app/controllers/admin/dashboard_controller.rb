class Admin::DashboardController < ApplicationController

  # before_filter :authorize

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @category_count = Category.count
    @product_count = Product.count
    @sales_count = Sale.count
  end
end
