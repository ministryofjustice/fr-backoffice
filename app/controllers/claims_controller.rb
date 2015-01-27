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
    puts "++++++ DEBUG CREATE ++++++ #{__FILE__}::#{__LINE__} ++++\n"
    ap params
    
  end

  def update
  end

  def destroy
  end

  def show
  end

  def edit
  end
end
