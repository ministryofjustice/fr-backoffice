class RemissionCalculatorController < ApplicationController

  def thresholds
    calculator = RemissionCalculator.new(params[:status].to_sym, params[:num_children].to_i)
    render json: calculator.thresholds    
  end

  def contribution
    calculator = RemissionCalculator.new(params[:status].to_sym, params[:num_children].to_i)
    render json: {maximim_contribution: calculator.maximum_contribution(params[:income].to_f) }
  end


end