class IntegerToStringService < ApplicationService
  attr_reader :atrs

  def initialize(atrs:)
    @atrs = atrs
  end
  
  def call
    atrs[:value].to_s
  end 
end 
