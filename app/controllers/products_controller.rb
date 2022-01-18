class ProductsController < ApplicationController

  before_filter :authorize

  def index
    @products = Product.all.order(created_at: :desc)
      update_all_to_sale_price
  end

  def show
    @product = Product.find params[:id]
      update_product_to_sale_price
  end

  private

  def update_all_to_sale_price
    if Sale.active.any?
      @products.each do |product|
        product.price = product.price * (100 - Sale.active.order(percent_off: :desc).first.percent_off) / 100
      end
    end
  end

  def update_product_to_sale_price
    if Sale.active.any?
      @product.price = @product.price * (100 - Sale.active.order(percent_off: :desc).first.percent_off) / 100
    end
  end

end
