class ClaimsController < ApplicationController
  def index
  end

  def new
    puts "++++++ DEBUG NEW ++++++ #{__FILE__}::#{__LINE__} ++++\n"
    
    @claim = Claim.new
    @claim.applicant = Applicant.new
    @claim.evidence = Evidence.new
    @mers = MissingEvidenceReason.all
  end

  def create
    @claim_constructor = ClaimConstructor.new(claim_params)
  end

  def update
  end

  def destroy
  end

  def show
  end

  def edit
  end


  private


  def claim_params
      params.require(:claim).permit(:remission_type, :new_case, :case_number, :refund, :fee_paid_date, :refund_reference_number)
  end
end
