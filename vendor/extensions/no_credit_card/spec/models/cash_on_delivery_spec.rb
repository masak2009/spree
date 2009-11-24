require File.dirname(__FILE__) + '/../spec_helper'

describe CashOnDelivery do
  before(:each) do
    @cash_on_delivery = CashOnDelivery.new
  end

  it "should be valid" do
    @cash_on_delivery.should be_valid
  end
end
