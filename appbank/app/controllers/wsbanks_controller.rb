class WsbanksController < ApplicationController
  soap_service namespace: 'urn:WashOutBank', camelize_wsdl: :lower
  # make case
  soap_action "make",
              :args   => { :start => :integer, :end => :integer, :user => :integer, :amount => :double},
              :return => :boolean
  def make
    operation = Transaction.create(amount: params[:amount], startAcount_id: params[:start], finalAcount_id: params[:end], iduser: params[:user])
    render :soap => true
  end

  # check case
  soap_action "check",
              :args   => { :start => :integer, :end => :integer, :amount => :double},
              :return => :boolean
  def check
    amount = params[:amount]
    validate = true
    if !(Account.exists?(id: params[:start]))
      validate = false
    end
    if !(Account.exists?(id: params[:end]))
      validate = false
    end
    render :soap => validate
  end
end
