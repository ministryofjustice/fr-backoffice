
# full_remission threshold
# no remission threshold
# max. contribution 


class RemissionCalculator

  @@remission_threshold   = 1085
  @@remission_cap         = 5085
  @@partner_premium       = 160
  @@per_child_premium     = 245
  @@step_increase         = 10
  @@fee_per_step_increase = 5
  @@max_possible_fee      = 1920



  def initialize(status, num_children)
    @status = status
    @num_children = num_children
    raise ArgumentError.new("Invalid Status") unless [:partnered, :single].include?(@status)
  end
  


  def full_remission_threshold
    adjust_for_partner_and_children(@@remission_threshold)
  end


  def partial_remission_cap
    adjust_for_partner_and_children(@@remission_cap)
  end

  def maximum_contribution(income)
    return @@max_possible_fee if income >= partial_remission_cap
    threshold = full_remission_threshold
    return 0 if income < threshold + @@step_increase
    
    excess = income - threshold
    steps = (excess / @@step_increase).to_i
    steps * @@fee_per_step_increase
  end

  def thresholds
    {
      full_remission_threshold: full_remission_threshold,
      partial_remission_cap: partial_remission_cap
    }
  end


  private

  def adjust_for_partner_and_children(threshold)
    threshold += @@partner_premium if partnered?
    threshold += (@num_children * @@per_child_premium)
    threshold
  end

  def partnered?
    @status == :partnered
  end


end