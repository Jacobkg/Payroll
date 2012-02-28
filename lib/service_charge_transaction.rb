class ServiceChargeTransaction
  
  def initialize(member_id, date, charge)
    @member_id = member_id
    @date = date
    @charge = charge
  end
  
  def execute
    e = PayrollDatabase.get_union_member(@member_id)
    af = e.affiliation
    af.add_service_charge(@date, @charge)
  end
  
end