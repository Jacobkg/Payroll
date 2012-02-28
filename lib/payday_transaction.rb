class PaydayTransaction
  
  def initialize(date)
    @date = date
    @paychecks = Hash.new
  end
  
  def execute
    for id in PayrollDatabase.get_all_employee_ids
      employee = PayrollDatabase.get_employee(id)
      if employee.is_pay_date?(@date)
        pc = Paycheck.new(@date)
        @paychecks[id] = pc
        employee.payday(pc)
      end
    end
  end
  
  def get_paycheck(id)
    @paychecks[id]
  end
  
end

