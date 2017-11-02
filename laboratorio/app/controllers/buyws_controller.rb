class BuywsController < ApplicationController
  soap_service namespace: 'urn:WashOutStore', camelize_wsdl: :lower

  # save sale case
  soap_action "save_sale",
              :args   => {:user => :integer, :product => :integer},
              :return => :boolean
  def save_sale
    operation = Sale.create(Product_id: params[:product], User_id: params[:user])
    render :soap => true
  end

  # check user product case
  soap_action "check_user_product",
              :args   => { :user => :integer, :product => :integer},
              :return => :boolean
  def check_user_product
    validate = true
    if !(User.exists?(id: params[:user]))
      validate = false
    end
    if !(Product.exists?(id: params[:product]))
      validate = false
    end
    render :soap => validate
  end
end
