ActiveAdmin.register Subject do
  permit_params :title, :description, :hours, :difficulty_level, :teacher_id, :lessons_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :hours
    column :difficulty_level
    column :teacher
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :description
  filter :hours
  filter :difficulty_level
  filter :teacher
  filter :created_at
  filter :updated_at

  action_item :export_csv, only: :index do
    link_to 'Download CSV', export_csv_admin_subjects_path(format: :csv)
  end

  collection_action :export_csv, method: :get do
    @subjects = Subject.all

    respond_to do |format|
      format.csv { send_data @subjects.to_csv, filename: "subjects-#{Date.today}.csv" }
    end
  end
end