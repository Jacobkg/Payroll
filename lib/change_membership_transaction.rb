require 'change_affiliation_transaction'

class ChangeMembershipTransaction < ChangeAffiliationTransaction
  
  def initialize(id, member_id, dues)
    super(id)
    @member_id = member_id
    @dues = dues
  end
  
  def get_affiliation
    UnionAffiliation.new(@dues)
  end
  
  def record_membership(e)
    PayrollDatabase.add_union_member(@member_id, e)
  end
  
end