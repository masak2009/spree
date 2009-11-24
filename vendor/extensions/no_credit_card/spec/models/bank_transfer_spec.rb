require File.dirname(__FILE__) + '/../spec_helper'

describe BankTransfer do
  before(:each) do
    @bank_transfer = BankTransfer.new
  end

  it "should be valid" do
    @bank_transfer.should be_valid
  end
end
