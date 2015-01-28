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
  has_one     :evidence

  validates :remission_type, inclusion: { in: %w(full partial none), message: "%{value} is not a valid status" }, allow_nil: true
  validates :remission_type, presence: true
  validates_associated :evidence, :applicant

  @@submodels = [:applicant, :evidence]


  def error_messages
    messages = self.errors.full_messages
    @@submodels.each do |submodel|
      messages += self.send(submodel).errors.full_messages unless self.send(submodel).nil?
    end
    messages
  end



  private

  def submodel_validation
    add_errors_from(:evidence) unless @evidence.valid?
    add_errors_from(:applicant) unless @applicant.valid?
  end


end
