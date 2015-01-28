require 'rails_helper'

RSpec.describe ClaimsController, :type => :controller do

  pending describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create, claim_params
      expect(response).to have_http_status(:success)
    end
  end

  pending describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  pending describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  pending describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  pending describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end

private

def claim_params
  HashWithIndifferentAccess.new({
    "utf8"=>"✓", 
    "authenticity_token"=>"Udc0BghNaOIzx/NcwrcgaIqOd5w9NRlsV5Xi9EfXkQU=", 
    "applicant"=>{
        "title"=>"Mr", 
        "forename"=>"Stephen", 
        "surname"=>"Richards", 
        "date_of_birth(3i)"=>"13", 
        "date_of_birth(2i)"=>"08", 
        "date_of_birth(1i)"=>"1963", 
        "ni_number"=>"ys452311g", 
        "status"=>"Single", 
        "num_dependent_children"=>"1"}, 
    "evidence"=>{
        "supplied"=>"No", 
        "missing_evidence"=>{
            "reason_5"=>"5", 
            "reason_6"=>"6"}, 
        "custom_reason"=>"Wrong, just wrong"}, 
    "claim"=>{
        "remission_type"=>"partial", 
        "new_case"=>"1", 
        "case_number"=>"CRA-15/67565", 
        "refund"=>"0", 
        "fee_paid_date(3i)"=>"15", 
        "fee_paid_date(2i)"=>"05", 
        "fee_paid_date(1i)"=>"2015", 
        "refund_reference_number"=>"REF-42424"}
    })
end
