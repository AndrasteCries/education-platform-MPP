# frozen_string_literal: true

require "test_helper"

class SubjectTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_teacher = subject_teachers(:one)
  end

  test "should get index" do
    get subject_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_teacher_url
    assert_response :success
  end

  test "should create subject_teacher" do
    assert_difference("SubjectTeacher.count") do
      post subject_teachers_url,
           params: {subject_teacher: {group_id: @subject_teacher.group_id, subject_id: @subject_teacher.subject_id,
                                      teacher_id: @subject_teacher.teacher_id}}
    end

    assert_redirected_to subject_teacher_url(SubjectTeacher.last)
  end

  test "should show subject_teacher" do
    get subject_teacher_url(@subject_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_teacher_url(@subject_teacher)
    assert_response :success
  end

  test "should update subject_teacher" do
    patch subject_teacher_url(@subject_teacher),
          params: {subject_teacher: {group_id: @subject_teacher.group_id, subject_id: @subject_teacher.subject_id,
                                     teacher_id: @subject_teacher.teacher_id}}
    assert_redirected_to subject_teacher_url(@subject_teacher)
  end

  test "should destroy subject_teacher" do
    assert_difference("SubjectTeacher.count", -1) do
      delete subject_teacher_url(@subject_teacher)
    end

    assert_redirected_to subject_teachers_url
  end
end
