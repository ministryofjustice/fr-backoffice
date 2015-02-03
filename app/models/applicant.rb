# == Schema Information
#
# Table name: applicants
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  forename               :string(255)
#  surname                :string(255)
#  date_of_birth          :date
#  ni_number              :string(255)
#  status                 :string(255)
#  partners_age           :integer
#  num_dependent_children :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class Applicant < ActiveRecord::Base


  has_many :applications

  validates :title, :forename, :surname, :date_of_birth, :ni_number, presence: true
  validate  :ni_number_validation
  validate  :date_of_birth_validation



  def ni_number_validation
    unless self.ni_number_before_type_cast.nil?
      unless self.ni_number_before_type_cast.valid?
        errors[:ni_number] << 'Invalid National Insurance Number'
      end
    end
  end


  def date_of_birth_validation
    unless self.date_of_birth.nil?
      if self.date_of_birth > 18.years.ago
        errors[:date_of_birth] << 'Applicant must be at least 18 years of age'
      end
    end
  end


  def ni_number=(string)
    write_attribute(:ni_number, NationalInsuranceNumber.new(string))
  end

  def ni_number
    "#{read_attribute(:ni_number)}"
  end

end
