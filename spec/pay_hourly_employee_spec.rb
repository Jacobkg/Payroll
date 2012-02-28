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
  
  def validate_hourly_paycheck(pt, id, pay_date, pay)
    pc = pt.get_paycheck(id)
    pc.should_not be_nil
    pc.pay_date.should == pay_date
    pc.gross_pay.should == pay
  end
  
end