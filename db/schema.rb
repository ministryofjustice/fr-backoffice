# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150203155917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: true do |t|
    t.string   "title"
    t.string   "forename"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "ni_number"
    t.string   "status"
    t.integer  "partners_age"
    t.integer  "num_dependent_children"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_threshold",                default: 300000
    t.boolean  "savings_exceed_first_threshold", default: true
    t.string   "income_status"
  end

  create_table "claims", force: true do |t|
    t.integer  "applicant_id"
    t.string   "form_number"
    t.string   "procedure_name"
    t.integer  "value"
    t.integer  "court_fee"
    t.date     "application_date"
    t.string   "remission_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_case"
    t.string   "case_number"
    t.boolean  "refund"
    t.string   "refund_reference_number"
    t.date     "fee_paid_date"
    t.date     "date_signed"
    t.string   "reference_number"
  end

  create_table "evidences", force: true do |t|
    t.integer  "claim_id"
    t.boolean  "supplied"
    t.string   "reason_ids"
    t.text     "custom_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missing_evidence_reasons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
