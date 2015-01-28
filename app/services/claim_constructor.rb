class ClaimConstructor

  attr_reader :claim

  def initialize(params)
    puts "++++++ DEBUG permitted params ++++++ #{__FILE__}::#{__LINE__} ++++\n"
    pp params
    
    evidence_params = convert_bools(params[:evidence], :supplied)
    @evidence = Evidence.new(evidence_params)

    @applicant = Applicant.new(params[:applicant])

    claim_params = convert_bools(params[:claim], :new_case, :refund)
    @claim = Claim.new(claim_params)
    @claim.applicant = @applicant
    @claim.evidence = @evidence
  end



  private

  def convert_bools(hash, *keys)
    
    keys.each { |key|  hash[key] = convert_bool(hash[key]) }
    hash
  end

  def convert_bool(value)
    case value
    when 0, '0', 'false', false, 'No', 'NO', 'no'
      false
    else
      true
    end
  end
  

end