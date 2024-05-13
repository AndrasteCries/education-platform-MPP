require "application_system_test_case"

class MarksTest < ApplicationSystemTestCase
  setup do
    @mark = marks(:one)
  end

  test "visiting the index" do
    visit marks_url
    assert_selector "h1", text: "Marks"
  end

  test "should create mark" do
    visit marks_url
    click_on "New mark"

    fill_in "Date", with: @mark.date
    fill_in "Mark", with: @mark.mark
    fill_in "Student", with: @mark.student_id
    fill_in "Task", with: @mark.task_id
    click_on "Create Mark"

    assert_text "Mark was successfully created"
    click_on "Back"
  end

  test "should update Mark" do
    visit mark_url(@mark)
    click_on "Edit this mark", match: :first

    fill_in "Date", with: @mark.date
    fill_in "Mark", with: @mark.mark
    fill_in "Student", with: @mark.student_id
    fill_in "Task", with: @mark.task_id
    click_on "Update Mark"

    assert_text "Mark was successfully updated"
    click_on "Back"
  end

  test "should destroy Mark" do
    visit mark_url(@mark)
    click_on "Destroy this mark", match: :first

    assert_text "Mark was successfully destroyed"
  end
end
