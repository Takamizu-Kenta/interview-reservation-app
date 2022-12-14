class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string    :name
      t.string    :name_furigana
      t.integer   :grade, comment: "学年"
      t.integer   :generation, comment: "期"
      t.string    :faculty_department, comment: "学部学科"
      t.string    :position, comment: "役職"
      t.string    :status, comment: "ステータス"
      t.timestamps
    end
  end
end
