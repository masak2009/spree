module GetxmlfeedHelper

  def round_price(product)
    (product.price / (1 + Spree::Config[:czech_vat])).round(2)
  end

end

