require 'payday_transaction'

describe "Paying hourly employees" do
  
  let(:id) { 2 }
  let(:t) { AddHourlyEmployee.new(id, "Bill", "Home", 15.25) }
  let(:pay_date) { Date.new(2001,11,9) } #Friday
  let(:pt) { PaydayTransaction.new(pay_date) }
  
  before do
    t.execute
  end
  
  it "pays a single hourly employee with no time cards" do
    pt = PaydayTransaction.new(pay_date)
    pt.execute
    validate_hourly_paycheck(pt, id, pay_date, 0.0)
  end
  
  it "pays a single hourly employee with one time card" do
    tc = TimeCardTransaction.new(pay_date, 2.0, id)
    tc.execute
    
    pt.execute
    validate_hourly_paycheck(pt, id, pay_date, 30.5)
  end
  
  it "pays overtime" do
    tc = TimeCardTransaction.new(pay_date, 9.0, id)
    tc.execute
    
    pt.execute
    validate_hourly_paycheck(pt, id, pay_date, (8 + 1.5) * 15.25)
  end
  
  it "pays single employee with two time cards" do
    tc = TimeCardTransaction.new(pay_date, 2.0, id)
    tc.execute
    tc2 = TimeCardTransaction.new(Date.new(2001,11,8), 5.0, id)
    tc2.execute
    
    pt.execute
    validate_hourly_paycheck(pt, id, pay_date, 7*15.25)
  end
  
  it "only pays for timecards during the current pay period" do
    date_in_previous_period = Date.new(2001,11,2)
    
    tc = TimeCardTransaction.new(pay_date, 2.0, id)
    tc.execute
    tc2 = TimeCardTransaction.new(date_in_previous_period, 5.0, id)
    tc2.execute
    
    pt.execute
    validate_hourly_paycheck(pt, id, pay_date, 2*15.25)
  end
  
  it "doesn't pay out on the wrong date" do
    pay_date = Date.new(2001,11,8) #Thursday
    tc = TimeCardTransaction.new(pay_date, 9.0, id)
    tc.execute
    
    pt =  PaydayTransaction.new(pay_date)
    pt.execute
    pt.get_paycheck(id).should be_nil
  end
  
  def validate_hourly_paycheck(pt, id, pay_date, pay)
    pc = pt.get_paycheck(id)
    pc.should_not be_nil
    pc.pay_date.should == pay_date
    pc.gross_pay.should == pay
  end
  
end