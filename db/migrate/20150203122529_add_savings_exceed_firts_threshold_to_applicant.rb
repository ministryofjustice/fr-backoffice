class AddSavingsExceedFirtsThresholdToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :first_threshold, :integer, default: 3_000_00
    add_column :applicants, :savings_exceed_first_threshold, :boolean, default: true
  end
end
