require 'nokogiri'
require 'savon'
require 'resolv-replace'

class WebserviceController < ApplicationController
  soap_service namespace: 'urn:WashOutWS', camelize_wsdl: :lower

  soap_action "check_operation",
              :args   => { :userId => :integer, :productId => :integer, :startAccount => :integer, :endAccount => :integer, :amount => :double },
              :return => :string
  def check_operation
    puts("ingreso a la funcion, intento de conectar con savon")
    client = Savon.client(wsdl: "http://192.168.1.10:9080/OperationESBService/OperationESBPort?wsdl")
    puts("pasa conexion con savon, intento a reconocer las operaciones")
    client.operations #[:operation_esb_operation]
    puts("pasa operaciones, intento de hacer llamado al metodo")
    response = client.call(:operation_esb_operation, message: {userId: params[:userId], productId: params[:productId], startAccount: params[:startAccount], endAccount: params[:endAccount], amount: params[:amount]})
    puts("pasa llamado, intento retornar respuesta")
    puts(response.body.to_s)
    render :soap => response.body
  end
end
