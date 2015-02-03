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

class Claim < ActiveRecord::Base

  belongs_to  :applicant

  validates_associated  :applicant

  before_create :generate_unique_number

  @@submodels = [:applicant]


  def error_messages
    messages = self.errors.full_messages
    @@submodels.each do |submodel|
      messages += self.send(submodel).errors.full_messages unless self.send(submodel).nil?
    end
    messages
  end



  private

  def generate_unique_number
    self.reference_number = SecureRandom.hex(4)
  end

  def submodel_validation
    add_errors_from(:evidence) unless @evidence.valid?
    add_errors_from(:applicant) unless @applicant.valid?
  end


end
