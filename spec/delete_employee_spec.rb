require 'delete_employee_transaction'

describe DeleteEmployeeTransaction do
  
  it "deletes the employee" do
    emp_id = 3
    t = AddSalariedEmployee.new(emp_id, "Lance", "Home", 1000)
    t.execute
    
    e = PayrollDatabase.get_employee(emp_id)
    e.should_not be_nil
    
    dt = DeleteEmployeeTransaction.new(emp_id)
    dt.execute
    
    e = PayrollDatabase.get_employee(emp_id)
    e.should be_nil
  end
end