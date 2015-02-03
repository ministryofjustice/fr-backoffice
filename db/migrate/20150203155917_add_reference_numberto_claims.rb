class AddReferenceNumbertoClaims < ActiveRecord::Migration
  def change
    add_column :claims, :reference_number, :string
  end
end
