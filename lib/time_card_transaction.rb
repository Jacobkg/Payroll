require 'time_card'

class TimeCardTransaction
  
  def initialize(date, hours, id)
    @date = date
    @hours = hours
    @id = id
  end
  
  def execute
    e = PayrollDatabase.get_employee(@id)
    hc = e.classification
    hc.add_time_card(TimeCard.new(@date, @hours))
  end
  
end