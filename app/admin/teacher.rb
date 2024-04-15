# frozen_string_literal: true

ActiveAdmin.register Teacher do
  permit_params :first_name, :last_name, :middle_name, :email

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :middle_name
    column :email
    actions
  end

  # filter :teacher_id
  # filter :hours
end
