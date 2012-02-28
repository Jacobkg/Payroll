require 'change_employee_transaction'

class ChangeClassificationTransaction < ChangeEmployeeTransaction
  
  def initialize(id)
    @id = id
  end
  
  def change(e)
    e.classification = get_classification
    e.schedule = get_schedule
  end
  
end