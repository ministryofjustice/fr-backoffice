class AddCaseTypeToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :new_case, :boolean
    add_column :claims, :case_number, :string
  end
end
