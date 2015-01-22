require 'spec_helper'


describe NationalInsuranceNumber, type: :model do

  context 'validation' do
    it 'should accept a valid NI number without spaces' do
      ni = NationalInsuranceNumber.new('YS327288X')
      expect(ni.valid?).to be true
    end

    it 'should accept a valid NI number with spaces ' do
      ni = NationalInsuranceNumber.new('YS 32 72 88 X')
      expect(ni.valid?).to be true
    end

    it 'should accept a valid NI number with lower case letters ' do
      ni = NationalInsuranceNumber.new('ys 32 72 88 x')
      expect(ni.valid?).to be true
    end

    it 'should not accept an invalid NI number' do
      ni = NationalInsuranceNumber.new('ys ab 72 88 x')
      expect(ni.valid?).to be false
    end
  end


  describe '#to_s' do
    it 'should return a formatted NI number' do
      ni = NationalInsuranceNumber.new('YS327288X')
      expect(ni.to_s).to eq 'YS 32 72 88 X'
    end
  end


end
