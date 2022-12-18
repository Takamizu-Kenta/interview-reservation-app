ActiveAdmin.register Member do
  permit_params :name, :name_furigana, :grade, :generation, :faculty_department, :position, :status

  index do
    selectable_column
    id_column
    column :name
    column :name_furigana
    column :email
    column :grade
    column :generation
    column :faculty_department
    column :position
    column :status
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :name_furigana
      row :grade
      row :generation
      row :faculty_department
      row :position
      row :status
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name, label: "名前 ※性と名の間に半角スペース"
      f.input :name_furigana, label: "ふりがな ※性と名の間に半角スペース"
      f.input :email
      f.input :grade, as: :select
      f.input :generation
      f.input :faculty_department, as: :select, collection: Member.faculty_departments.keys
      f.input :position
      f.input :status, as: :select, collection: Member.statuses.keys
    end
    f.actions
  end

  filter :name
  filter :email
  filter :grade
  filter :generation
  filter :faculty_department
end
