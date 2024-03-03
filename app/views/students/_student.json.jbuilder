json.extract! student, :id, :first_name, :middle_name, :last_name, :group_id, :phone_number, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
