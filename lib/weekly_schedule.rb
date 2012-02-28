class WeeklySchedule
  
  def is_pay_date?(date)
    date.wday == 5
  end
  
end