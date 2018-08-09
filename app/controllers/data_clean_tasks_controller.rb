class DataCleanTasksController < ApplicationController
  before_action :set_data_clean_task, only: [:show, :edit, :update, :destroy]

  # GET /data_clean_tasks
  # GET /data_clean_tasks.json
  def index
    @data_clean_tasks = DataCleanTask.all
  end

  # GET /data_clean_tasks/1
  # GET /data_clean_tasks/1.json
  def show
  end

  # GET /data_clean_tasks/new
  def new
    @data_clean_task = DataCleanTask.new(task_id: params[:task_id], task_name: params[:task_name])
  end

  # GET /data_clean_tasks/1/edit
  def edit
  end

  # POST /data_clean_tasks
  # POST /data_clean_tasks.json
  def create
    @data_clean_task = DataCleanTask.new(data_clean_task_params)

    respond_to do |format|
      if @data_clean_task.save
        format.html { redirect_to @data_clean_task, notice: 'Data clean task was successfully created.' }
        format.json { render :show, status: :created, location: @data_clean_task }
      else
        format.html { render :new }
        format.json { render json: @data_clean_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_clean_tasks/1
  # PATCH/PUT /data_clean_tasks/1.json
  def update
    respond_to do |format|
      if @data_clean_task.update(data_clean_task_params)
        format.html { redirect_to @data_clean_task, notice: 'Data clean task was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_clean_task }
      else
        format.html { render :edit }
        format.json { render json: @data_clean_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_clean_tasks/1
  # DELETE /data_clean_tasks/1.json
  def destroy
    @data_clean_task.destroy
    respond_to do |format|
      format.html { redirect_to data_clean_tasks_url, notice: 'Data clean task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_clean_task
      @data_clean_task = DataCleanTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_clean_task_params
      params.require(:data_clean_task).permit(:task_id, :task_name)
    end
end
