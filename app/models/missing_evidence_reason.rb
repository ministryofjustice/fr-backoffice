# == Schema Information
#
# Table name: missing_evidence_reasons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MissingEvidenceReason < ActiveRecord::Base
end
