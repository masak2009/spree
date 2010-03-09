class GetxmlfeedController < ApplicationController

  #get XML feed for zbozi.cz
  #require gem "builder" for working
  def zbozicz
    @xml = Builder::XmlMarkup.new
    @products = Product.find(:all)
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def hledejceny
    @xml = Builder::XmlMarkup.new
    @products = Product.find(:all)
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def monitorcz
    @xml = Builder::XmlMarkup.new
    @products = Product.find(:all)
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def naakupcz
    @xml = Builder::XmlMarkup.new
    @products = Product.find(:all)
    respond_to do |format|
      format.xml {render :action => :zbozicz }
    end
  end

  def jyxocz
    @xml = Builder::XmlMarkup.new
    @products = Product.find(:all)
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end
end
