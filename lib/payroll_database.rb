class PayrollDatabase  
  @@employees = Hash.new
  @@union_map = Hash.new
  
  def self.reset!
    @@employees = Hash.new
  end
  
  def self.get_employee(empid)
    @@employees[empid]
  end
  
  def self.add_employee(empid, e)
    @@employees[empid] = e
  end
  
  def self.delete_employee(empid)
    @@employees.delete(empid)
  end
  
  def self.get_all_employee_ids
    @@employees.keys
  end
  
  def self.add_union_member(member_id, empid)
    @@union_map[member_id] = empid
  end
  
  def self.get_union_member(member_id)
    @@union_map[member_id]
  end
end