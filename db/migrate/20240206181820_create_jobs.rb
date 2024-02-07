class CreateJobs < ActiveRecord::Migration[7.1]
  def up
    create_enum :status, ['Applied', 'Interviewing', 'Rejected', 'Accepted', 'Role Closed']

    create_table :jobs do |t|
      t.string :company_name, null: false, comment: 'The name of the company the job is for'
      t.string :role_name, null: false, comment: 'The job title'
      t.string :referral, null: true, comment: 'The person that referred this job'
      t.column :status, enum_type: status, null: false, comment: 'The status of this job application'
      t.decimal :salary_min, precision: 8, scale: 2, null: true, comment: 'Minimum for the salary range'
      t.decimal :salary_max, precision: 8, scale: 2, null: true, comment: 'Maximum for the salary range'
      t.decimal :hourly_rate, precision: 8, scale: 2, null: true, comment: 'The hourly rate for the job'
      t.string :url, null: false, comment: 'URL to the job posting'
      t.string :hiring_manager_name, null: true, comment: 'Hiring manager name'
      t.string :hiring_manager_email, null: true, comment: "Hiring manager email"
      t.timestamps
    end

    def down
      drop_table :jobs

      execute <<-SQL
    DROP TYPE status;
      SQL
    end
  end
end
