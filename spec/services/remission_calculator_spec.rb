require 'spec_helper'



describe RemissionCalculator, type: :service do

  describe '.new' do
    it 'should error if status invalid' do
      expect {
        RemissionCalculator.new(:married, 2)
      }.to raise_error ArgumentError, "Invalid Status"
    end
  end


  describe '#maximum_contribution' do
    context 'single' do
      context 'no children' do
        it 'should return zero for income under the threshold' do
          rc = RemissionCalculator.new(:single, 0)
          expect(rc.maximum_contribution(1066)).to eq 0
        end

        it 'should return zero for income less than £10 over the threshold' do
          rc = RemissionCalculator.new(:single, 0)
          expect(rc.maximum_contribution(1094.90)).to eq 0
        end

        it 'should return £15 for an income £33.45 over the threshold' do
          rc = RemissionCalculator.new(:single, 0)
          expect(rc.maximum_contribution(1118.45)).to eq 15
        end
      end
    end
  end


  describe '#full_remission_threshold' do

    context 'single' do
    
      it 'should return 1085 for single person with no children' do
        rc = RemissionCalculator.new(:single, 0)
        expect(rc.full_remission_threshold).to eq 1085
      end

      it 'should return 1330 for single person with 1 child' do
        rc = RemissionCalculator.new(:single, 1)
        expect(rc.full_remission_threshold).to eq 1330
      end

      it 'should return 1575 for single person with 2 children' do
        rc = RemissionCalculator.new(:single, 2)
        expect(rc.full_remission_threshold).to eq 1575
      end

      it 'should return 2310 for single person with 5 children' do
        rc = RemissionCalculator.new(:single, 5)
        expect(rc.full_remission_threshold).to eq 2310
      end
    end

    context 'partnered' do

      it 'should return 1245 for partnered person with no children' do
        rc = RemissionCalculator.new(:partnered, 0)
        expect(rc.full_remission_threshold).to eq 1245
      end

      it 'should return 1490 for partnered person with 1 child' do
        rc = RemissionCalculator.new(:partnered, 1)
        expect(rc.full_remission_threshold).to eq 1490
      end

      it 'should return 1980 for partnered person with 3 children' do
        rc = RemissionCalculator.new(:partnered, 3)
        expect(rc.full_remission_threshold).to eq 1980
      end

      it 'should return 2225 for partnered person with 4 children' do
        rc = RemissionCalculator.new(:partnered, 4)
        expect(rc.full_remission_threshold).to eq 2225
      end
    end
  end


  describe 'partial_remission_cap' do
    context 'single' do
      it 'should return 5085 for single person with no children' do
        rc = RemissionCalculator.new(:single, 0)
        expect(rc.partial_remission_cap).to eq 5085
      end

      it 'should return 5330 for single person with 1 child' do
        rc = RemissionCalculator.new(:single, 1)
        expect(rc.partial_remission_cap).to eq 5330
      end

      it 'should return 5575 for single person with 2 children' do
        rc = RemissionCalculator.new(:single, 2)
        expect(rc.partial_remission_cap).to eq 5575
      end

      context 'partnered' do
        it 'should return 5245 for partnered person with no children' do
        rc = RemissionCalculator.new(:partnered, 0)
        expect(rc.partial_remission_cap).to eq 5245
      end

      it 'should return 5490 for partnered person with 1 child' do
        rc = RemissionCalculator.new(:partnered, 1)
        expect(rc.partial_remission_cap).to eq 5490
      end

      it 'should return 5980 for partnered person with 3 children' do
        rc = RemissionCalculator.new(:partnered, 3)
        expect(rc.partial_remission_cap).to eq 5980
      end
      end
    end
  end


  describe '#thresholds' do
    it 'should return a hash with the two thresholds' do
      rc = RemissionCalculator.new(:partnered, 1)
      expect(rc.thresholds).to eq( {full_remission_threshold: 1490, partial_remission_cap: 5490} )
    end
  end


end