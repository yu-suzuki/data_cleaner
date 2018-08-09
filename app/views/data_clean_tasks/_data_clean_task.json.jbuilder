json.extract! data_clean_task, :id, :task_id, :task_name, :created_at, :updated_at
json.url data_clean_task_url(data_clean_task, format: :json)
