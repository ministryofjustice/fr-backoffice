class ClaimConstructor

  def initialize(params)
    puts "++++++ DEBUG notice ++++++ #{__FILE__}::#{__LINE__} ++++\n"
    pp params
    
    @claim = Claim.new(params)
    pp @claim
    
  end
  

end