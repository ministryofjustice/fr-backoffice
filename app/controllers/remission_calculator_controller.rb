class RemissionCalculatorController < ApplicationController

  def thresholds
    raise ArgumentError.new("Invalid Query String") unless param_string_includes(:status, :num_children)
    calculator = RemissionCalculator.new(params[:status].to_sym, params[:num_children].to_i)
    render json: calculator.thresholds    
  end

  def contribution
    raise ArgumentError.new("Invalid Query String") unless param_string_includes(:status, :num_children, :income)
    
    calculator = RemissionCalculator.new(params[:status].to_sym, params[:num_children].to_i)
    render json: {maximum_contribution: calculator.maximum_contribution(params[:income].to_f) }
  end



  private

  def param_string_includes(*args)
    args.each do |param_key|
      return false unless params.include?(param_key)
    end
    return true
  end

end