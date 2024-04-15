# frozen_string_literal: true

require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url
    click_on "New task"

    fill_in "Deadline", with: @task.deadline
    fill_in "Lesson", with: @task.lesson_id
    fill_in "Material", with: @task.material
    fill_in "Max mark", with: @task.max_mark
    fill_in "Notes", with: @task.notes
    fill_in "Title", with: @task.title
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    fill_in "Deadline", with: @task.deadline
    fill_in "Lesson", with: @task.lesson_id
    fill_in "Material", with: @task.material
    fill_in "Max mark", with: @task.max_mark
    fill_in "Notes", with: @task.notes
    fill_in "Title", with: @task.title
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
