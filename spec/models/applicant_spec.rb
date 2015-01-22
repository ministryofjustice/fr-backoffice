require 'rails_helper'

describe Applicant, :type => :model do

  context 'validations' do

    let(:applicant)   { Applicant.new(
                            title:  'Mr',
                            forename: 'Stephen',
                            surname: 'Richards',
                            date_of_birth: 20.years.ago)}

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
        applicant.date_of_birth = 18.years.ago - 1.day
        expect(applicant.valid?).to be false
        expect(applicant.errors[:date_of_birth]).to eq ['Applicant must be at least 18 years of age']
      end
    end
  end




end
