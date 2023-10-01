require "application_system_test_case"

class WorksheetsTest < ApplicationSystemTestCase
  setup do
    @worksheet = worksheets(:one)
  end

  test "visiting the index" do
    visit worksheets_url
    assert_selector "h1", text: "Worksheets"
  end

  test "should create worksheet" do
    visit worksheets_url
    click_on "New worksheet"

    check "Completed" if @worksheet.completed
    fill_in "Completed at", with: @worksheet.completed_at
    fill_in "Completed by", with: @worksheet.completed_by
    fill_in "Created by", with: @worksheet.created_by
    fill_in "Deadline", with: @worksheet.deadline
    fill_in "Description", with: @worksheet.description
    fill_in "Task manager", with: @worksheet.task_manager
    fill_in "Title", with: @worksheet.title
    click_on "Create Worksheet"

    assert_text "Worksheet was successfully created"
    click_on "Back"
  end

  test "should update Worksheet" do
    visit worksheet_url(@worksheet)
    click_on "Edit this worksheet", match: :first

    check "Completed" if @worksheet.completed
    fill_in "Completed at", with: @worksheet.completed_at
    fill_in "Completed by", with: @worksheet.completed_by
    fill_in "Created by", with: @worksheet.created_by
    fill_in "Deadline", with: @worksheet.deadline
    fill_in "Description", with: @worksheet.description
    fill_in "Task manager", with: @worksheet.task_manager
    fill_in "Title", with: @worksheet.title
    click_on "Update Worksheet"

    assert_text "Worksheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Worksheet" do
    visit worksheet_url(@worksheet)
    click_on "Destroy this worksheet", match: :first

    assert_text "Worksheet was successfully destroyed"
  end
end
