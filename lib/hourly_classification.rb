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
    @time_cards.values.inject(0.0) do |sum, time_card|
      sum += calculate_pay_for_time_card(time_card)
    end
  end
  
  private
  
  def calculate_pay_for_time_card(time_card)
    overtime = [time_card.hours - 8.0, 0].max
    straight_time = time_card.hours - overtime
    straight_time * @rate + overtime * @rate * 1.5
  end
end