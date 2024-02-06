class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|

      t.timestamps
    end
  end
end
