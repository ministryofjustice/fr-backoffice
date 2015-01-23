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

require 'rails_helper'

describe Evidence, :type => :model do

  let(:r1)        { FactoryGirl.create :missing_evidence_reason_1 }
  let(:r2)        { FactoryGirl.create :missing_evidence_reason_2 }


  describe '#<<' do
    it 'should append ids to reason_ids array' do
      evidence = Evidence.new
      evidence.supplied = true
      evidence << r1
      evidence << r2
      expect(evidence.reason_ids).to eq ([ r1.id, r2.id] )
    end


    it 'should not add the id of a reason already in the array' do
      evidence = Evidence.new(supplied: true, reason_ids: [r1.id, r2.id])
      evidence << r2
      expect(evidence.reason_ids).to eq( [ r1.id, r2.id ] )
    end

    it 'should raise an error if the id of any of the reasons being added is nil' do
      evidence = Evidence.new(supplied: true, reason_ids: [r1.id, r2.id])
      expect {
        evidence << FactoryGirl.build(:missing_evidence_reason_1)
      }.to raise_error RuntimeError, "MissingEvidenceReason objects must be saved before they can be added to an Evidence object"
    end
  end

  describe '#reasons' do
    it 'should return an array of reasons whose ids are in reason_ids' do
      evidence = Evidence.new(supplied: true, reason_ids: [r2.id, r1.id])
      expect(evidence.reasons).to eq ( [ r2, r1 ] )
    end
  end


  describe '#reasons=' do
    it 'should replace existing reason ids with new reason ids' do
      evidence = Evidence.new(supplied: true, reason_ids: [r2.id, r1.id])
      r3 = FactoryGirl.create(:missing_evidence_reason_1, name: 'No Bank statement for addtiional account')
      r4 = FactoryGirl.create(:missing_evidence_reason_1, name: 'No explanation of additional income')
      evidence.reasons = [ r3, r4 ]
      expect(evidence.reason_ids).to eq( [ r3.id, r4.id ])
    end

    it 'should raise an error if any of the reasons being added have not been saved to the db' do
      evidence = Evidence.new(supplied: true, reason_ids: [r2.id, r1.id])
      reasons = [ FactoryGirl.build(:missing_evidence_reason_1), FactoryGirl.build(:missing_evidence_reason_2)] 
      expect {
        evidence.reasons = reasons
      }.to raise_error RuntimeError, "MissingEvidenceReason objects must be saved before they can be added to an Evidence object"
    end
  end
  




end
