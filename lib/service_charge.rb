class ServiceCharge
  
  attr_reader :amount
  def initialize(date, charge)
    @date = date
    @amount = charge
  end
  
end