class Paycheck
  
  attr_reader :pay_date
  def initialize(date)
    @pay_date = date
  end
  
  attr_accessor :gross_pay
  
end