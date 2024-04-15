# frozen_string_literal: true

json.extract! lesson, :id, :title, :subject_id, :notes, :date, :teacher_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
