class MonthlySchedule
  
  def is_pay_date?(date)
    m1 = date.month
    m2 = (date+1).month
    m1 != m2
  end
  
end