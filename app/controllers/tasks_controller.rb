class TasksController < ApplicationController
  include ApplicationHelper

  def create
    @house_chore = HouseChore.find_by(params[:id])
    @task = @house_chore.tasks.build(task_params)

    if @task.save
      redirect_to house_chore_path(@house_chore)
    else

      render "house_chores/show"
    end
  end

  def destroy
    @House_chore = HouseChore.find(params[:house_chore_id])
    @task = Task.find(params[:task_id])
    @task.destroy

    redirect_to house_chore_path(@house_chore)
  end

  private

    def task_params
      params.require(:task).permit(:description, :house_chore_id)
    end
end
