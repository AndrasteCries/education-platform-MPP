require "application_system_test_case"

class SubjectTeachersTest < ApplicationSystemTestCase
  setup do
    @subject_teacher = subject_teachers(:one)
  end

  test "visiting the index" do
    visit subject_teachers_url
    assert_selector "h1", text: "Subject teachers"
  end

  test "should create subject teacher" do
    visit subject_teachers_url
    click_on "New subject teacher"

    fill_in "Group", with: @subject_teacher.group_id
    fill_in "Subject", with: @subject_teacher.subject_id
    fill_in "Teacher", with: @subject_teacher.teacher_id
    click_on "Create Subject teacher"

    assert_text "Subject teacher was successfully created"
    click_on "Back"
  end

  test "should update Subject teacher" do
    visit subject_teacher_url(@subject_teacher)
    click_on "Edit this subject teacher", match: :first

    fill_in "Group", with: @subject_teacher.group_id
    fill_in "Subject", with: @subject_teacher.subject_id
    fill_in "Teacher", with: @subject_teacher.teacher_id
    click_on "Update Subject teacher"

    assert_text "Subject teacher was successfully updated"
    click_on "Back"
  end

  test "should destroy Subject teacher" do
    visit subject_teacher_url(@subject_teacher)
    click_on "Destroy this subject teacher", match: :first

    assert_text "Subject teacher was successfully destroyed"
  end
end
