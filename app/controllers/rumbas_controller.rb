class RumbasController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  soap_action "integer_to_string",
              :args   => :integer,
              :return => :string
  def integer_to_string
  render :soap => params[:value].to_s
  end

  soap_action "concat",
              :args   => { :a => :string, :b => :string },
              :return => :string
  def concat
    render :soap => (params[:a] + params[:b])
  end
end 