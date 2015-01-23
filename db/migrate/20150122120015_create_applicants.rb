class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string  :title
      t.string  :forename
      t.string  :surname
      t.date    :date_of_birth
      t.string  :ni_number
      t.string  :status
      t.integer :partners_age
      t.integer :num_dependent_children
      t.timestamps
    end
  end
end