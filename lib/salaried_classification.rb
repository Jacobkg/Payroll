class SalariedClassification
  
  attr_reader :salary
  def initialize(salary)
    @salary = salary
  end
  
  def calculate_pay
    @salary
  end
  
end