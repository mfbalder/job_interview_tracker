# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_206_181_839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "status", ["Applied", "Interviewing", "Rejected", "Accepted", "Role Closed"]

  create_table "interviews", force: :cascade do |t|
    t.bigint "jobs_id"
    t.date "datetime", null: false, comment: "The date and time of the interview"
    t.string "notes", comment: "Notes taken during the interview"
    t.string "questions_to_ask", comment: "Questions to ask the interviewer and answers"
    t.string "reflections", comment: "To track performance impressions after the interview"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jobs_id"], name: "index_interviews_on_jobs_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company_name", null: false, comment: "The name of the company the job is for"
    t.string "role_name", null: false, comment: "The job title"
    t.string "referral", comment: "The person that referred this job"
    t.enum "status", null: false, comment: "The status of this job application", enum_type: "status"
    t.decimal "salary_min", precision: 8, scale: 2, comment: "Minimum for the salary range"
    t.decimal "salary_max", precision: 8, scale: 2, comment: "Maximum for the salary range"
    t.decimal "hourly_rate", precision: 8, scale: 2, comment: "The hourly rate for the job"
    t.string "url", null: false, comment: "URL to the job posting"
    t.string "hiring_manager_name", comment: "Hiring manager name"
    t.string "hiring_manager_email", comment: "Hiring manager email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interviews", "jobs", column: "jobs_id"
end
