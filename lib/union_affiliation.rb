require 'service_charge'

class UnionAffiliation
  
  attr_reader :dues
  
  def initialize(dues)
    @dues = dues
    @service_charges = Hash.new
  end
  
  def service_charge(date)
    @service_charges[date]
  end
  
  def add_service_charge(date, charge)
    @service_charges[date] = ServiceCharge.new(date, charge)
  end
  
end