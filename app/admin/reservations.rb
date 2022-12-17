ActiveAdmin.register Reservation do
  permit_params :name, :member_id, :faculty_department, :day, :time, :start_time, :online_or_offline, :email

  index do
    selectable_column
    id_column
    column :member
    column :email
    column :faculty_department
    column :online_or_offline
    column :day
    column :time
    actions
  end

  show do
    attributes_table do
      row :member
      row :email
      row :faculty_department
      row :online_or_offline
      row :day
      row :time
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name, form_options: { class: 'title-field' }
      f.input :email, form_options: { class: 'title-field' }
      f.input :faculty_department, as: :select, collection: Member.faculty_departments.keys, form_options: { class: 'title-field' }
      f.input :day, as: :date_picker, form_options: { class: 'title-field' }
      f.input :time, as: :time_picker, form_options: { class: 'title-field' }
      f.input :online_or_offline, form_options: { class: 'title-field' }
    end
    f.actions
  end

  filter :email
  filter :faculty_department
  filter :online_or_offline
  filter :created_at
end
