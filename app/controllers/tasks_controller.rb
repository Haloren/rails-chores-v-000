class TasksController < ApplicationController
  def create
    @chore = Chore.find(params[:chore_id])
    @task = @chore.tasks.build(task_params)
    @task.save

    redirect_to chore_path(@chore)
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end
end
