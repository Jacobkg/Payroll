require 'payday_transaction'

describe "Paying hourly employees" do
  
  let(:id) { 2 }
  it "pays a single hourly employee with no time cards" do
    t = AddHourlyEmployee.new(id, "Bill", "Home", 15.25)
    t.execute
    
    pay_date = Date.new(2001,11,9) #Friday
    pt = PaydayTransaction.new(pay_date)
    pt.execute
    validate_hourly_paycheck(pt, id, pay_date, 0.0)
  end
  
  def validate_hourly_paycheck(pt, id, pay_date, pay)
    pc = pt.get_paycheck(id)
    pc.should_not be_nil
    pc.pay_date.should == pay_date
    pc.gross_pay.should == pay
  end
  
end