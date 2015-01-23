class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.integer :claim_id
      t.boolean :supplied
      t.string :reason_ids
      t.text :custom_reason

      t.timestamps
    end
  end
end
