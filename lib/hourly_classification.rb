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
  
  def calculate_pay(paycheck)
    pay_period = paycheck.pay_date
    @time_cards.values.inject(0.0) do |sum, time_card|
      if is_in_pay_period(time_card, pay_period)
        sum += calculate_pay_for_time_card(time_card)
      else
        sum += 0
      end
    end
  end
  
  private
  
  def is_in_pay_period(time_card, pay_period)
    pay_period_end_date = pay_period
    pay_period_start_date = pay_period - 5
    time_card_date = time_card.date
    (time_card_date >= pay_period_start_date and time_card_date <= pay_period_end_date)
  end
  
  def calculate_pay_for_time_card(time_card)
    overtime = [time_card.hours - 8.0, 0].max
    straight_time = time_card.hours - overtime
    straight_time * @rate + overtime * @rate * 1.5
  end
end