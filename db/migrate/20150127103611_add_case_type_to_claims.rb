class AddCaseTypeToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :new_case, :boolean
    add_column :claims, :case_number, :string
    # add_column :claims, :refund, :boolean
    # add_column :claims, :refund_reference_number, :string
    # add_column :claims, :fee_paid_date, :date
  end
end
