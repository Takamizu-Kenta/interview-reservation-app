class ChangeDataFacultyDepartmentToMember < ActiveRecord::Migration[7.0]
  def up
    # rubocop:disable Rails/BulkChangeTable
    change_column :members, :faculty_department, "integer USING CAST(faculty_department AS integer)", comment: "学部学科"
  end

  def down
    change_column :members, :faculty_department, "character varying USING CAST(faculty_department AS character varying)", comment: "学部学科"
  end
end
