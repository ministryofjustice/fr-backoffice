class AddDateSignedToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :date_signed, :date
  end
end
