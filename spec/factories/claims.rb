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

FactoryGirl.define do
  factory :claim do
    applicant           { FactoryGirl.create(:applicant) }
    procedure_name      "Bank Statement"
    court_fee           12000
    application_date    Date.today
    remission_type      'full'
  end

end
