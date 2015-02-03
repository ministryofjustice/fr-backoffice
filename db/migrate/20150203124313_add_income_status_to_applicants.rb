class AddIncomeStatusToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :income_status, :string
  end
end
