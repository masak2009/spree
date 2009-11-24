# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NoCreditCardExtension < Spree::Extension
  version "1.0"
  description "Enable pay by bank transfer and pay after send"
  url "http://yourwebsite.com/no_credit_card"

  # Please use no_credit_card/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  

  def activate
    
    #This Method override save of Payment - by credit card or by bank transfer or cash on delivery
    CheckoutsController.class_eval do
      update.after do
        if params[:bank_transfer]
          if params[:bank_transfer][:payment] == "1"
            BankTransfer.create(:order_id => @order.id)
            @order.complete
          elsif params[:bank_transfer][:cash_on_delivery] == "1"
            CashOnDelivery.create(:order_id => @order.id)            
            @order.complete
          end
        end
        @order.save!		# expect messages here
    end   

    end

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes

    #Admin::BaseController.class_eval do
    #  before_filter :add_yourextension_tab
    #
    #  def add_yourextension_tab
    #    # add_extension_admin_tab takes an array containing the same arguments expected
    #    # by the tab helper method:
    #    #   [ :extension_name, { :label => "Your Extension", :route => "/some/non/standard/route" } ]
    #    add_extension_admin_tab [ :yourextension ]
    #  end
    #end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
