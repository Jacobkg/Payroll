require 'add_salaried_employee'
require 'salaried_classification'
require 'add_hourly_employee'
require 'hourly_classification'
require 'weekly_schedule'

describe "Adding employees" do
  
  let (:emp_id) { 1 }
  
  it "adds a salaried employee" do
    t = AddSalariedEmployee.new(emp_id, "Bob", "Home", 1000.00)
    t.execute
    
    e = PayrollDatabase.get_employee(emp_id)
    e.name.should == "Bob"
    
    pc = e.classification
    pc.should be_a SalariedClassification
    pc.salary.should be_close 1000, 0.001

    ps = e.schedule
    ps.should be_a MonthlySchedule
    
    pm = e.pay_method
    pm.should be_a HoldMethod
  end
  
  it "adds an hourly employee" do
    t = AddHourlyEmployee.new(emp_id, "Bob", "Home", 8.75)
    t.execute
    
    e = PayrollDatabase.get_employee(emp_id)
    e.name.should == "Bob"
    
    pc = e.classification
    pc.should be_a HourlyClassification
    pc.rate.should == 8.75
    
    e.schedule.should be_a WeeklySchedule
    e.pay_method.should be_a HoldMethod
  end

end