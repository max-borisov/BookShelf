module OrdersHelper
  def format_order_created_date order
    order.created_at.strftime('%d/%m/%Y %T')
  end
end
