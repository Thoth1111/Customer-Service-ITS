require "test_helper"

class WorksheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worksheet = worksheets(:one)
  end

  test "should get index" do
    get worksheets_url
    assert_response :success
  end

  test "should get new" do
    get new_worksheet_url
    assert_response :success
  end

  test "should create worksheet" do
    assert_difference("Worksheet.count") do
      post worksheets_url, params: { worksheet: { completed: @worksheet.completed, completed_at: @worksheet.completed_at, completed_by: @worksheet.completed_by, created_by: @worksheet.created_by, deadline: @worksheet.deadline, description: @worksheet.description, task_manager: @worksheet.task_manager, title: @worksheet.title } }
    end

    assert_redirected_to worksheet_url(Worksheet.last)
  end

  test "should show worksheet" do
    get worksheet_url(@worksheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_worksheet_url(@worksheet)
    assert_response :success
  end

  test "should update worksheet" do
    patch worksheet_url(@worksheet), params: { worksheet: { completed: @worksheet.completed, completed_at: @worksheet.completed_at, completed_by: @worksheet.completed_by, created_by: @worksheet.created_by, deadline: @worksheet.deadline, description: @worksheet.description, task_manager: @worksheet.task_manager, title: @worksheet.title } }
    assert_redirected_to worksheet_url(@worksheet)
  end

  test "should destroy worksheet" do
    assert_difference("Worksheet.count", -1) do
      delete worksheet_url(@worksheet)
    end

    assert_redirected_to worksheets_url
  end
end
