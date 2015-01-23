class ClaimController < ApplicationController
  def index
  end

  def new
    @claim = Claim.new
    @claim.applicant = Applicant.new
    @claim.evidence = Evidence.new
  end

  def create
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
