# == Schema Information
#
# Table name: claims
#
#  id               :integer          not null, primary key
#  applicant_id     :integer
#  form_number      :string(255)
#  procedure_name   :string(255)
#  value            :integer
#  court_fee        :integer
#  application_date :date
#  remission_type   :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Claim < ActiveRecord::Base

  belongs_to  :applicant
  has_one     :evidence

  validates :remission_type, inclusion: { in: %w(full partial none), message: "%{value} is not a valid status" }


end
