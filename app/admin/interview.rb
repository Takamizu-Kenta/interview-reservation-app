ActiveAdmin.register Interview do
  permit_params :member, :member_id, :interview_date, :interviewer, :interview_content

  index do
    selectable_column
    id_column
    column :member
    column :interview_date
    column :interviewer
    column :updated_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :member
      row :interview_date
      row :interviewer
      row :interview_content do |c|
        raw(c.interview_content.gsub(/\n/, '<br>'))
      end
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :member
      f.input :interview_date, as: :datetime_picker
      f.input :interviewer
      f.input :interview_content
    end
    f.actions
  end

  filter :member
  filter :interview_date
  filter :interviewer
  filter :created_at
end
