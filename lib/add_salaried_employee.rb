require 'add_employee_transaction'
require 'salaried_classification'
require 'monthly_schedule'

class AddSalariedEmployee < AddEmployeeTransaction
  
  def initialize(empid, name, address, salary)
    super(empid, name, address)
    @salary = salary
  end
  
  def get_classification
    SalariedClassification.new(@salary)
  end
  
  def get_schedule
    MonthlySchedule.new
  end
  
end