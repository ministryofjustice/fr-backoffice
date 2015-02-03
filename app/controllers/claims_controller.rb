class ClaimsController < ApplicationController
  def index
  end

  def new
    @claim = Claim.new
    @claim.applicant = Applicant.new
    @mers = MissingEvidenceReason.all
  end

  def create
    @mers = MissingEvidenceReason.all
    @claim = ClaimConstructor.new(permitted_params).claim
    

    if @claim.save
      flash[:notice] = "Claim #{@claim.id} created successfully"
      redirect_to completion_claim_path(id: @claim.id)
    else
      render :new
    end
  end


  def completion
    @claim = Claim.find(params[:id])
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
      claim_params = params.require(:claim).permit!
      applicant_params = params.require(:applicant).permit!
      {claim: claim_params, applicant: applicant_params}
  end
end
