class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.references :job, index: true, foreign_key: true
      t.date :date, null: false, comment: 'The date of the interview'
      t.datetime :start_time, null: false, comment: 'The start time of the interview'
      t.datetime :end_time, null: true, comment: 'The end time of the interview'
      t.string :interviewer_name, null: false, comment: 'The name of the person conducting the interview'
      t.string :notes, null: true, comment: 'Notes taken during the interview'
      t.string :questions_to_ask, null: true, comment: 'Questions to ask the interviewer and answers'
      t.string :reflections, null: true, comment: 'To track performance impressions after the interview'
      t.timestamps
    end
  end
end
