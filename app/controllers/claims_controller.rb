class ClaimsController < ApplicationController
  def index
  end

  def new
    puts "++++++ DEBUG NEW ACTION ++++++ #{__FILE__}::#{__LINE__} ++++\n"
    
    @claim = Claim.new
    @claim.applicant = Applicant.new
    @claim.evidence = Evidence.new
    @mers = MissingEvidenceReason.all
  end

  def create
    puts "++++++ DEBUG create action ++++++ #{__FILE__}::#{__LINE__} ++++\n"
    
    @mers = MissingEvidenceReason.all
    @claim = ClaimConstructor.new(permitted_params).claim
    

    if @claim.save
      puts "++++++ DEBUG saved OK ++++++ #{__FILE__}::#{__LINE__} ++++\n"
      
      flash[:notice] = "Claim #{@claim.id} created successfully"
      redirect_to action: :new
    else
      puts "++++++ DEBUG not saved! ++++++ #{__FILE__}::#{__LINE__} ++++\n"
      
      render :new
    end
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


  def permitted_params
      claim_params = params.require(:claim).permit(:remission_type, :new_case, :case_number, :refund, :fee_paid_date, :refund_reference_number)
      evidence_params = params.require(:evidence).permit!
      applicant_params = params.require(:applicant).permit(:title, :forename, :surname, :date_of_birth, :ni_number, :status, :num_dependent_children)
      {claim: claim_params, evidence: evidence_params, applicant: applicant_params}
  end
end
