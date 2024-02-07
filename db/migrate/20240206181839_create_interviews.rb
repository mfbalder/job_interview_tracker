class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.references :jobs, index: true, foreign_key: true
      t.date :datetime, null: false, comment: 'The date and time of the interview'
      t.string :notes, null: true, comment: 'Notes taken during the interview'
      t.string :questions_to_ask, null: true, comment: 'Questions to ask the interviewer and answers'
      t.string :reflections, null: true, comment: 'To track performance impressions after the interview'
      t.timestamps
    end
  end
end
