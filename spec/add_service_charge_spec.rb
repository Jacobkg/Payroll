require 'service_charge_transaction'
require 'union_affiliation'

describe ServiceChargeTransaction do
  
  it "adds the service charge" do
    id = 2
    t = AddHourlyEmployee.new(id, "Bill", "Home", 15.25)
    t.execute
    
    e = PayrollDatabase.get_employee(id)
    
    af = UnionAffiliation.new(90.21)
    e.affiliation = af
    
    member_id = 86
    PayrollDatabase.add_union_member(member_id, e)
    
    sct = ServiceChargeTransaction.new(member_id, 20011101, 12.95)
    sct.execute
    
    sc = af.service_charge(20011101)
    sc.should_not be_nil
    sc.amount.should == 12.95
  end
  
end