class Applicant < NonPersistedBase


  attr_accessor :title, 
                :forename, 
                :surname, 
                :date_of_birth, 
                :partners_age, 
                :num_dependent_children

  validates :title, :forename, :surname, :date_of_birth, :ni_number, presence: true
  validate  :ni_number_validation
  validate  :date_of_birth_validation

  def initialize(params = {})
    super
    @ni_number = NationalInsuranceNumber.new(params[:ni_number])
  end

  def ni_number_validation
    unless @ni_number.valid?
      errors[:ni_number] << 'Invalid National Insurance Number'
    end
  end


  def date_of_birth_validation
    unless @date_of_birth.nil?
      if @date_of_birth < 18.years.ago
        errors[:date_of_birth] << 'Applicant must be at least 18 years of age'
      end
    end
  end


  def ni_number=(string)
    @ni_number = NationalInsuranceNumber.new(string)
  end

  def ni_number
    @ni_number.to_s
  end

end
