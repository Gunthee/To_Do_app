class TasksController < ApplicationController
    def index
      @tasks = Task.where(status: false) # Only display incomplete tasks
      @task = Task.new                   # For the new task form
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = false               # Set default status as incomplete
  
      if @task.save
        redirect_to tasks_path, notice: 'Task was successfully created.'
      else
        render :index
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: true)
  
      redirect_to tasks_path, notice: 'Task marked as complete.'
    end
  
    private
  
    def task_params
      params.require(:task).permit(:name)
    end
  end
  