class HourlyClassification
  
  attr_reader :rate
  def initialize(rate)
    @rate = rate
    @time_cards = {}
  end
  
  def add_time_card(time_card)
    @time_cards[time_card.date] = time_card
  end
  
  def time_card(date)
    @time_cards[date]
  end
  
  def calculate_pay
    0.0
  end
  
end