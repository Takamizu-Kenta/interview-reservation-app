class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.string    :member
      t.string    :interviewer
      t.text      :interview_content
      t.datetime  :interview_date
      t.timestamps
    end
  end
end
