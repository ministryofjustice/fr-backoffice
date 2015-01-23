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
#  created_at       :datetime
#  updated_at       :datetime
#



require 'rails_helper'

describe Claim, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
