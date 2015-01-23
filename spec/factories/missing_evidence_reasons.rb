# == Schema Information
#
# Table name: missing_evidence_reasons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :missing_evidence_reason_1, class: MissingEvidenceReason do
    name "Bank Statement"
  end

  factory :missing_evidence_reason_2, class: MissingEvidenceReason do
    name "DWP statement of benfits received"
  end

end
