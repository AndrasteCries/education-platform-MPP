ActiveAdmin.register Subject do
  permit_params :teacher_id, :title, :hours, :desctiption

  index do
    selectable_column
    id_column
    column :title
    column :hours
    column :desctiption
    column :teacher_id
    actions
  end

  filter :teacher_id
  filter :hours

end
