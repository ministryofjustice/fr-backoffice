# == Schema Information
#
# Table name: claims
#
#  id                      :integer          not null, primary key
#  applicant_id            :integer
#  form_number             :string(255)
#  procedure_name          :string(255)
#  value                   :integer
#  court_fee               :integer
#  application_date        :date
#  remission_type          :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  new_case                :boolean
#  case_number             :string(255)
#  refund                  :boolean
#  refund_reference_number :string(255)
#  fee_paid_date           :date
#

require 'rails_helper'

describe Claim, :type => :model do

  let(:claim)  { FactoryGirl.create(:claim) }


  context 'validation' do
    context 'remission type' do
      
      it 'should validate all valid remission types' do
        %w{ full partial none }.each do |rt|
          claim.remission_type = rt
          expect(claim).to be_valid
        end
      end

      it 'should reject missing remission type' do
        claim.remission_type = nil
        expect(claim).not_to be_valid
        expect(claim.errors[:remission_type]).to eq ["can't be blank"]
      end

      it 'should not validate invalid remission types' do
        claim.remission_type = 'semi-remitted'
        expect(claim).not_to be_valid
      end

    end
  end
end
