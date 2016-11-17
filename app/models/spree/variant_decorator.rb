Spree::Variant.class_eval do
  include ActionView::Helpers::NumberHelper

  def to_hash
    actual_price = price
    # actual_price += Calculator::Vat.calculate_tax_on(self) if Spree::Config[:show_price_inc_vat]
    {
      id: id,
      in_stock: in_stock?,
      price: number_to_currency(actual_price)
    }
  end
end
