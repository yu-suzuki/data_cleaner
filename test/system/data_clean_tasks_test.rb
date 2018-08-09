require "application_system_test_case"

class DataCleanTasksTest < ApplicationSystemTestCase
  setup do
    @data_clean_task = data_clean_tasks(:one)
  end

  test "visiting the index" do
    visit data_clean_tasks_url
    assert_selector "h1", text: "Data Clean Tasks"
  end

  test "creating a Data clean task" do
    visit data_clean_tasks_url
    click_on "New Data Clean Task"

    fill_in "Task", with: @data_clean_task.task_id
    fill_in "Task Name", with: @data_clean_task.task_name
    click_on "Create Data clean task"

    assert_text "Data clean task was successfully created"
    click_on "Back"
  end

  test "updating a Data clean task" do
    visit data_clean_tasks_url
    click_on "Edit", match: :first

    fill_in "Task", with: @data_clean_task.task_id
    fill_in "Task Name", with: @data_clean_task.task_name
    click_on "Update Data clean task"

    assert_text "Data clean task was successfully updated"
    click_on "Back"
  end

  test "destroying a Data clean task" do
    visit data_clean_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data clean task was successfully destroyed"
  end
end
