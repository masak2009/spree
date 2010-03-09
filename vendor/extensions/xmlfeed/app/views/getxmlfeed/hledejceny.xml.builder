xml.instruct! :xml, :version => "1.0", :encoding => "iso-8859-2"
xml.SHOP do
  @products.each do |product|
    xml.SHOPITEM do
      xml.PRODUCT product.name
      xml.URL "http://" + request.env["HTTP_HOST"] + "/products/" + product.permalink
      if  Spree::Config[:price_with_vat]
        xml.PRICE_VAT product.price
      else
        #using taxrates
      end
      xml.DESCRIPTION product.description
      if Image.find_by_viewable_id(product.id)
        xml.IMGURL "http://" + request.env["HTTP_HOST"] + "/assets/products/"+ Image.find_by_viewable_id(product.id).id.to_s + "/product/" + Image.find_by_viewable_id(product.id).attachment_file_name
      else
        xml.IMGURL        
      end
    end
  end
end



