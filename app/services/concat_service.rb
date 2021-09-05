class ConcatService < ApplicationService
  attr_reader :atrs

  def initialize(atrs:)
    @atrs = atrs
  end

  def call
    byebug
    atrs[:value_1] + atrs[:value_2]
  end
end 
