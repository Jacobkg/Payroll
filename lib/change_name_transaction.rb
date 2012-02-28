require 'change_employee_transaction'

class ChangeNameTransaction < ChangeEmployeeTransaction
  
  def initialize(id, name)
    super(id)
    @name = name
  end
  
  def change(employee)
    employee.name = @name
  end
  
end