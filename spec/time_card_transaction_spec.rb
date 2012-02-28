require 'time_card_transaction'

describe TimeCardTransaction do
  
  it "adds the time card to employee" do
    id = 2
    t = AddHourlyEmployee.new(id, "Bill", "Home", 15.25)
    t.execute
    
    tct = TimeCardTransaction.new(20011031, 8.0, id)
    tct.execute
    
    e = PayrollDatabase.get_employee(id)
    e.should_not be_nil
    
    hc = e.classification
    tc = hc.time_card(20011031)
    tc.hours.should == 8.0
  end
  
end