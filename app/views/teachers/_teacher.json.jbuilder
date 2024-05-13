json.extract! teacher, :id, :teacher_id, :first_name, :middle_name, :last_name, :phone_number, :email, :degree,
              :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
