# == Schema Information
#
# Table name: evidences
#
#  id            :integer          not null, primary key
#  claim_id      :integer
#  supplied      :boolean
#  reason_ids    :string(255)
#  custom_reason :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Evidence < ActiveRecord::Base

  serialize :reason_ids, Array

  belongs_to :claim



  def <<(reason)
    
    raise_unsaved_reason_error if reason.id.nil?
    self.reason_ids << reason.id unless self.reason_ids.include?(reason.id)
  end

  def reasons
    MissingEvidenceReason.find(reason_ids)
  end


  def reasons=(reasons)
    raise_unsaved_reason_error if any_ids_nil?(reasons)
    self.reason_ids = reasons.map(&:id)
    
  end

  private

  def raise_unsaved_reason_error
    raise "MissingEvidenceReason objects must be saved before they can be added to an Evidence object"
  end

  def any_ids_nil?(objects)
    ids = objects.map(&:id)
    ids.compact.size < ids.size
  end

end
