require 'add_salaried_employee'
require 'date'
require 'payday_transaction'
require 'paycheck'

describe "Paying single salaried employee" do
  
  let(:id) { 1 }
  let(:t) { AddSalariedEmployee.new(id, "Bob", "home", 1000.00) }
  
  before do
    PayrollDatabase.reset!
    t.execute
  end
  
  it "pays when date is correct" do
    pay_date = Date.new(2001,11,30)
    pt = PaydayTransaction.new(pay_date)
    pt.execute
    
    pc = pt.get_paycheck(id)
    pc.pay_date.should == pay_date
    pc.gross_pay.should == 1000.00
  end
  
  it "does not pay on the wrong date" do
    pay_date = Date.new(2001,11,29)
    pt = PaydayTransaction.new(pay_date)
    pt.execute
    
    pt.get_paycheck(id).should be_nil
  end
  
end