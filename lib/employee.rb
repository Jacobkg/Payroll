class Employee
  attr_accessor :name
  def initialize(empid, name, adress)
    @name = name
  end
  
  attr_accessor :classification, 
                :schedule,
                :pay_method,
                :affiliation
  
  def is_pay_date?(date)
    @schedule.is_pay_date?(date)
  end
  
  def payday(paycheck)
    pay = @classification.calculate_pay(paycheck)
    paycheck.gross_pay = pay
  end
  
end