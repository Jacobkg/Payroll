require 'add_employee_transaction'

class AddHourlyEmployee < AddEmployeeTransaction
  def initialize(id, name, address, rate)
    super(id, name, address)
    @rate = rate
  end
  
  def get_classification
    HourlyClassification.new(@rate)
  end
  
  def get_schedule
    WeeklySchedule.new
  end
  
  
end