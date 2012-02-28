class ChangeEmployeeTransaction
  
  def initialize(id)
    @id = id
  end
  
  def execute
    e = PayrollDatabase.get_employee(@id)
    change(e)
  end
  
end