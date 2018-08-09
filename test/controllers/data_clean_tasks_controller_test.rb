require 'test_helper'

class DataCleanTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_clean_task = data_clean_tasks(:one)
  end

  test "should get index" do
    get data_clean_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_data_clean_task_url
    assert_response :success
  end

  test "should create data_clean_task" do
    assert_difference('DataCleanTask.count') do
      post data_clean_tasks_url, params: { data_clean_task: { task_id: @data_clean_task.task_id, task_name: @data_clean_task.task_name } }
    end

    assert_redirected_to data_clean_task_url(DataCleanTask.last)
  end

  test "should show data_clean_task" do
    get data_clean_task_url(@data_clean_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_clean_task_url(@data_clean_task)
    assert_response :success
  end

  test "should update data_clean_task" do
    patch data_clean_task_url(@data_clean_task), params: { data_clean_task: { task_id: @data_clean_task.task_id, task_name: @data_clean_task.task_name } }
    assert_redirected_to data_clean_task_url(@data_clean_task)
  end

  test "should destroy data_clean_task" do
    assert_difference('DataCleanTask.count', -1) do
      delete data_clean_task_url(@data_clean_task)
    end

    assert_redirected_to data_clean_tasks_url
  end
end
