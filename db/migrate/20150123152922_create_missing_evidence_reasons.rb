class CreateMissingEvidenceReasons < ActiveRecord::Migration
  def change
    create_table :missing_evidence_reasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
