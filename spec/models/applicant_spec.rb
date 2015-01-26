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



require 'rails_helper'

describe Applicant, :type => :model do

  let(:applicant)   { Applicant.new(
                            title:  'Mr',
                            forename: 'Stephen',
                            surname: 'Richards',
                            ni_number: 'ys327296x',
                            status: 'Single',
                            date_of_birth: 20.years.ago)}
  context 'validations' do
    context 'presence' do
      
      it 'should generate error messages for each mandatory attribute that isnt present' do
        a = Applicant.new
        expect(a.valid?).to be false
        expect(a.errors[:title]).to eq ["can't be blank"]
        expect(a.errors[:forename]).to eq ["can't be blank"]
        expect(a.errors[:surname]).to eq ["can't be blank"]
        expect(a.errors[:date_of_birth]).to eq ["can't be blank"]
        expect(a.errors[:ni_number]).to eq ["can't be blank"]
      end
    end

    context 'NI number format' do

      it 'should reject an invalid National Insurance number' do
        applicant.ni_number = 'YSAB1234C'
        expect(applicant.valid?).to be false
        expect(applicant.errors[:ni_number]).to eq ['Invalid National Insurance Number']
      end
    end

    context 'date of birth validation' do
      it 'should not accept a date of birth less than 18 years ago' do
        applicant.date_of_birth = 18.years.ago + 1.day
        expect(applicant.valid?).to be false
        expect(applicant.errors[:date_of_birth]).to eq ['Applicant must be at least 18 years of age']
      end
    end


    context 'status' do
      it 'should recognise Single as valid' do
        applicant.status = 'Single'
        expect(applicant).to be_valid
      end
      it 'should recognise Couple as valid' do
        applicant.status = 'Couple'
        expect(applicant).to be_valid
      end

      it 'should recognise any thing else as invalid' do
        applicant.status = 'Ménage à trois'
        expect(applicant).to_not be_valid
        expect(applicant.errors[:status]).to eq ["Ménage à trois is not a valid status"]
      end
    end
  end


  context 'persistence' do
    it 'should save and re-read and get same values in each column' do
      applicant.save!
      reloaded_applicant = Applicant.find(applicant.id)
      applicant.attribute_names.each do |attr_name|
        expect(applicant.send(attr_name)).to eq reloaded_applicant.send(attr_name)
      end
    end
  end




end
