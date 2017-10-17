class TasksController < ApplicationController
  def create
    @chore = Chore.find(params[:chore_id])
    @task = @chore.tasks.build(task_params)
    if @task.save
      redirect_to chore_path(@chore)
    else
      render "chores/show"
    end
  end

  def destroy
    @chore = Chore.find(params[:chore_id])
    @task = Task.find(params[:task_id])
    @task.destroy

    redirect_to chore_path(@chore)
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end
end
