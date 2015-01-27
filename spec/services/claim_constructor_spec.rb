require 'spec_helper'


describe ClaimConstructor do

  describe '.new' do

    it 'should construct a valid object from params' do
      cc = ClaimConstructor.new(params)
    end
  end


end


def params
  {
    "utf8"=>"✓", "authenticity_token"=>"Udc0BghNaOIzx/NcwrcgaIqOd5w9NRlsV5Xi9EfXkQU=", 
    "applicant"=>{
        "title"=>"tttt", 
        "forename"=>"fffff", 
        "surname"=>"sssss", 
        "date_of_birth(3i)"=>"13", 
        "date_of_birth(2i)"=>"08", 
        "date_of_birth(1i)"=>"1953", 
        "ni_number"=>"ni457812n", 
        "status"=>"Single", 
        "num_dependent_children"=>"1"}, 
    "evidence"=>{
        "supplied"=>"No", 
        "missing_evidence"=>{
            "reason_5"=>"5", 
            "reason_6"=>"6"}, 
        "custom_reason"=>"hghghghghghghghghg"}, 
    "claim"=>{
        "remission_type"=>"partial", 
        "new_case"=>"true", 
        "case_number"=>"CRA-15/67565", 
        "refund"=>"1", 
        "fee_paid(3i)"=>"07", 
        "fee_paid(2i)"=>"05", 
        "fee_paid(1i)"=>"2015", 
        "refund_reference_number"=>"REF-42424"
    }
  }
end
