# frozen_string_literal: true

json.extract! mark, :id, :student_id, :task_id, :date, :mark, :created_at, :updated_at
json.url mark_url(mark, format: :json)
