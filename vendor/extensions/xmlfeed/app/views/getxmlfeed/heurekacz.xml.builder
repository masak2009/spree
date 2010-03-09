xml.instruct!
xml.SHOP do
  @products.each do |product|
    xml.SHOPITEM do
      xml.PRODUCT product.name
      xml.DESCRIPTION product.description
      xml.URL "http://" + request.env["HTTP_HOST"] + "/products/" + product.permalink
      xml.AVAILABILITY 0
      if Image.find_by_viewable_id(product.id)
        xml.IMGURL "http://" + request.env["HTTP_HOST"] + "/assets/products/"+ Image.find_by_viewable_id(product.id).id.to_s + "/product/" + Image.find_by_viewable_id(product.id).attachment_file_name
      else
        xml.IMGURL        
      end
      if Spree::Config[:price_with_vat]
        xml.PRICE round_price(product)
        xml.PRICE_VAT product.price 
      else
        #fix for indidual vat pre product 
        xml.PRICE product.price
        xml.PRICE_VAT (product.price * (1 + Spree::Config[:czech_vat])).round(2)
      end
    end
  end
end

