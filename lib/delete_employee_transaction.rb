class DeleteEmployeeTransaction
  
  def initialize(emp_id)
    @emp_id = emp_id
  end
  
  def execute
    PayrollDatabase.delete_employee(@emp_id)
  end
  
end