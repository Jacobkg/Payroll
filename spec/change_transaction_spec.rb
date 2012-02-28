require 'add_hourly_employee'
require 'change_name_transaction'
require 'add_salaried_employee'
require 'change_hourly_transaction'
require 'change_membership_transaction'

describe "Changing employee" do
  
  let(:id) { 2}
  
  it "can change the name" do
    t = AddHourlyEmployee.new(id, "Bill", "Home", 15.25)
    t.execute
    
    cnt = ChangeNameTransaction.new(id, "Bob")
    cnt.execute
    
    e = PayrollDatabase.get_employee(id)
    e.should_not be_nil
    e.name.should == "Bob"
  end
  
  it "can change the payment classification" do
    t = AddSalariedEmployee.new(id, "Lance", "Home", 1000)
    t.execute
    
    cht = ChangeHourlyTransaction.new(id, 27.52)
    cht.execute
    
    e = PayrollDatabase.get_employee(id)
    e.should_not be_nil
    
    hc = e.classification
    hc.should be_a HourlyClassification    
    hc.rate.should == 27.52
    
    e.schedule.should be_a WeeklySchedule
  end
  
  it "can add membership to an employee" do
    member_id = 7734
    t = AddHourlyEmployee.new(id, "Bill", "Home", 15.25)
    t.execute
    
    cmt = ChangeMembershipTransaction.new(id, member_id, 99.42)
    cmt.execute
    
    e = PayrollDatabase.get_employee(id)
    e.should_not be_nil
    uf = e.affiliation
    uf.should be_a UnionAffiliation
    uf.dues.should == 99.42
    
    member = PayrollDatabase.get_union_member(member_id)
    member.should == e
  end
  
end