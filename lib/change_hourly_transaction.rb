require 'change_classification_transaction'

class ChangeHourlyTransaction < ChangeClassificationTransaction
  
  def initialize(id, rate)
    super(id)
    @rate = rate
  end
  
  def get_schedule
    WeeklySchedule.new
  end
  
  def get_classification
    HourlyClassification.new(@rate)
  end
  
end