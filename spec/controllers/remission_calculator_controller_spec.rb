describe RemissionCalculatorController, :type => :controller do

  render_views

  describe '#thresholds' do

    it 'should raise error if missing param' do
      params = {'status'=>'partnered', 'xnum_children'=>'2'}
      expect {
        get :thresholds, params
      }.to raise_error ArgumentError, 'Invalid Query String'
    end

    it 'should return a hash of threshold and cap' do
      params = {'status'=>'partnered', 'num_children'=>'2'}
      get :thresholds, params
      expect(response.status).to eq 200
      expect(ActiveSupport::JSON.decode(response.body)).to eq( {'full_remission_threshold' => 1735, 'partial_remission_cap' => 5735} )
    end
  end


  describe '#contribution' do
    it 'should raise error if missing a param' do
      params = {'status'=>'partnered', 'num_children'=>'2'}
      expect {
        get :contribution, params
      }.to raise_error ArgumentError, 'Invalid Query String'
    end


    it 'should return the maximum contribution for a given income' do
      params = {"status"=>'partnered', 'num_children'=>'2', 'income' => '4000'}
      get :contribution, params
      expect(response.status).to eq 200
      expect(ActiveSupport::JSON.decode(response.body)).to eq( {'maximum_contribution' => 1130} )
    end
  end



end