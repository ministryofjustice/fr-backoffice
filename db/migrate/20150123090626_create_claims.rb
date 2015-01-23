class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :applicant_id
      t.string  :form_number
      t.string  :procedure_name
      t.integer :value
      t.integer :court_fee
      t.date    :application_date
      t.timestamps
    end
  end
end
