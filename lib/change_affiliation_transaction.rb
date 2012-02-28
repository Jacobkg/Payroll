require 'change_employee_transaction'

class ChangeAffiliationTransaction < ChangeEmployeeTransaction
  
  def initialize(id)
    @id = id
  end
  
  def change(e)
    record_membership(e)
    e.affiliation = get_affiliation
  end
  
end