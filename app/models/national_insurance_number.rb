class NationalInsuranceNumber

  attr_reader :ni_code

  def initialize(string)
    raise "Bank" if string.is_a?(NationalInsuranceNumber)
    @ni_code = string.upcase.gsub(' ', '') unless string.nil?
  end
  

  def valid?
    return true if @ni_code.nil?
    result = @ni_code =~ /^[A-Z]{2}[0-9]{6}[A-Z]$/ 
    result == 0
  end

  def to_s
    return '' if @ni_code.nil?
    sprintf('%s %s %s %s %s', @ni_code[0..1], 
                              @ni_code[2..3], 
                              @ni_code[4..5],
                              @ni_code[6..7], 
                              @ni_code[8])
  end

  # needed to persist value in PG database
  def quoted_id
    to_s
  end

  # needed to persist value in PG database
  def id
    to_s
  end

end