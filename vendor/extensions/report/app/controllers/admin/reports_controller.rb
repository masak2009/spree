class Admin::ReportsController < Admin::BaseController
  before_filter :load_data  
  
  AVAILABLE_REPORTS = {
    :sales_total => {:name => "Sales Total", :description => "Sales Total For All Orders"}
  }

  def index
    @reports = AVAILABLE_REPORTS
  end
  
  def sales_total

    @search = Order.search(params[:search])

    #set order by to default or form result
    @search.order ||= "descend_by_created_at"
    
    @orders = @search.find_all_by_state("shipped")    

    price = 0;
    @orders.each { |x| price = price + x.item_total}
    @item_total = price
    price = 0;
    @orders.each { |x| price = price + x.adjustment_total}
    @charge_total = price
    price = 0;
    @orders.each { |x| price = price + x.credit_total}
    @credit_total = price
    price = 0;
    @orders.each { |x| price = price + x.total}
    @sales_total = price
  end

  private 
  def load_data

  end  

end
