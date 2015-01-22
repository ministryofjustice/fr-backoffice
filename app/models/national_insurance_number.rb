class NationalInsuranceNumber

  def initialize(string)
    @string = string.upcase.gsub(' ', '') unless string.nil?
  end
  

  def valid?
    return true if @string.nil?
    result = @string =~ /^[A-Z]{2}[0-9]{6}[A-Z]$/ 
    result == 0
  end

  def to_s
    return '' if @string.nil?
    sprintf('%s %s %s %s %s', @string[0..1],@string[2..3], @string[4..5],@string[6..7], @string[8])
  end

end