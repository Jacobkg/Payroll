require 'payroll_database'
require 'hold_method'
require 'employee'

class AddEmployeeTransaction
  
  def initialize(empid, name, address)
    @empid = empid
    @name = name
    @address = address
  end
  
  def execute
    e = Employee.new(@empid, @name, @address)
    e.classification = get_classification
    e.schedule = get_schedule
    e.pay_method = HoldMethod.new
    PayrollDatabase.add_employee(@empid, e)
  end
  
end