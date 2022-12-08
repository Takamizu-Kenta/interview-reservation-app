ActiveAdmin.register Reservation do
  permit_params :name, :affiliation, :day, :time, :start_time, :online_or_offline, :email

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :affiliation
    column :online_or_offline
    column :day
    column :time
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :affiliation
      row :online_or_offline
      row :day
      row :time
      row :updated_at
      row :created_at
    end
  end

  filter :email
  filter :affiliation
  filter :online_or_offline
  filter :created_at
end
