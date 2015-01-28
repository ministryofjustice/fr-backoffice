require 'spec_helper'


describe ClaimConstructor do

  describe '.new' do

    context 'evidence object' do
      it 'should construct a valid evidence object' do
        evidence = ClaimConstructor.new(params).instance_variable_get(:@evidence)
        expect(evidence.supplied).to be false
        expect(evidence.reason_ids).to eq( [ '5', '6' ] )
        expect(evidence.custom_reason).to eq 'Wrong, just wrong'
      end
    end

    context 'applicant object' do
      it 'should construct a valid applicant object' do
        applicant = ClaimConstructor.new(params).instance_variable_get(:@applicant)
        expect(applicant.title).to eq 'Mr'
        expect(applicant.forename).to eq 'Stephen'
        expect(applicant.surname).to eq 'Richards'
        expect(applicant.date_of_birth).to eq Date.new(1963, 8, 13)
        expect(applicant.ni_number).to eq 'YS 45 23 11 G' 
        expect(applicant.status).to eq 'Single'
        expect(applicant.num_dependent_children).to eq 1

      end
    end


    context 'claim object' do

      it 'should construct a valid object from params' do
        claim = ClaimConstructor.new(params).claim
        expect(claim.remission_type).to eq 'partial'
        expect(claim.new_case).to be true
        expect(claim.case_number).to eq 'CRA-15/67565'
        expect(claim.refund).to be false
        expect(claim.fee_paid_date).to eq Date.new(2015, 5, 15)
        expect(claim.refund_reference_number).to eq 'REF-42424'
        expect(claim.evidence).to be_a(Evidence)
        expect(claim.applicant).to be_a(Applicant)
      end

      it 'should handle params with new_case equal to false' do
        updated_params = params
        updated_params['claim']['new_case'] = '0'
        claim = ClaimConstructor.new(updated_params).claim
        expect(claim.new_case).to be false
      end

    end
  end


  describe 'private method convert_bools' do
    it 'should convert string representations of true and false to bools' do
      cc = ClaimConstructor.new(params)
      hash = params['claim']
      {
        '0'     => false,
        0       => false,
        false   => false,
        'false' => false,
        'No'    => false,
        'no'    => false,
        '1'     => true,
        1       => true,
        true    => true,
        'true'  => true,
        'Yes'   => true,
        'yes'   => true
      }.each do |key, bool|
        hash[:new_case] = key
        converted_hash = cc.send(:convert_bools, hash, :new_case)
        expect(converted_hash[:new_case]).to eq bool
      end
    end
  end

end


def params
  HashWithIndifferentAccess.new({
    "utf8"=>"✓", 
    "authenticity_token"=>"Udc0BghNaOIzx/NcwrcgaIqOd5w9NRlsV5Xi9EfXkQU=", 
    "applicant"=>{
        "title"=>"Mr", 
        "forename"=>"Stephen", 
        "surname"=>"Richards", 
        "date_of_birth(3i)"=>"13", 
        "date_of_birth(2i)"=>"08", 
        "date_of_birth(1i)"=>"1963", 
        "ni_number"=>"ys452311g", 
        "status"=>"Single", 
        "num_dependent_children"=>"1"}, 
    "evidence"=>{
        "supplied"=>"No", 
        "missing_evidence"=>{
            "reason_5"=>"5", 
            "reason_6"=>"6"}, 
        "custom_reason"=>"Wrong, just wrong"}, 
    "claim"=>{
        "remission_type"=>"partial", 
        "new_case"=>"1", 
        "case_number"=>"CRA-15/67565", 
        "refund"=>"0", 
        "fee_paid_date(3i)"=>"15", 
        "fee_paid_date(2i)"=>"05", 
        "fee_paid_date(1i)"=>"2015", 
        "refund_reference_number"=>"REF-42424"}
    })
end


