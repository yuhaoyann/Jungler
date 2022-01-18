module SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def current_sale
    Sale.active.order(percent_off: :desc).first
  end

end