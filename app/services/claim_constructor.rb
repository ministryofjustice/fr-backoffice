class ClaimConstructor

  attr_reader :claim

  def initialize(params)
    @evidence = Evidence.new( convert_bools(params[:evidence], :supplied) )
    @applicant = Applicant.new(params[:applicant])
    @claim = Claim.new( convert_bools(params[:claim], :new_case, :refund) )
    @claim.applicant = @applicant
    @claim.evidence = @evidence
  end


  def valid?
    
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