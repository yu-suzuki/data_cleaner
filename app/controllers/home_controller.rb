class HomeController < ApplicationController
  def index
    @tasks = CrowdSourcing::Task.all
  end

  def new
    @task = Task.new
  end
end
