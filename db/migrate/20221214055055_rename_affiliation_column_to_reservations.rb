class RenameAffiliationColumnToReservations < ActiveRecord::Migration[7.0]
  def up
    # rubocop:disable Rails/BulkChangeTable
    rename_column :reservations, :affiliation, :faculty_department
  end

  def down
    rename_column :reservations, :faculty_department, :affiliation
  end
end
