# frozen_string_literal: true

json.extract! task, :id, :title, :lesson_id, :notes, :deadline, :material, :max_mark, :created_at, :updated_at
json.url task_url(task, format: :json)
