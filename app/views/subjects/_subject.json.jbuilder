json.extract! subject, :id, :subject_id, :title, :description, :hours, :difficulty_level, :lessons_id, :created_at,
              :updated_at
json.url subject_url(subject, format: :json)
