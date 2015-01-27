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

FactoryGirl.define do
  factory :applicant do
    title                    'Mr'
    forename                 'Stephen'
    surname                  'Richards'
    date_of_birth            35.years.ago
    ni_number                'YS 32 72 88 X'
    status                   'Couple'
    partners_age             41
    num_dependent_children   2
  end

end
