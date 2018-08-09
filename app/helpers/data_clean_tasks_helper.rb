module DataCleanTasksHelper
  def options(id)
    CrowdSourcing::Option.where(task_id: id)
  end
end
