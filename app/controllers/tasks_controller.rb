class TasksController < ApplicationController
  include ApplicationHelper
  before_action :authorize

  def create
    @house_chore = HouseChore.find(params[:house_chore_id])
    @task = @house_chore.tasks.build(task_params)

    if @task.save
      render :json => JSON::parse(@task.to_json).merge(:delete_path => house_chore_task_path(@house_chore, :id => @task.id)).to_json
      # redirect_to house_chore_path(@house_chore)
    else
      raise params.inspect
      flash[:notice] = "Task was not saved"

      render :'house_chore/show'
    end
  end

  def destroy
    @house_chore = HouseChore.find(params[:house_chore_id])
    @task = Task.find(params[:task_id] || params[:id])
    @task.destroy

    redirect_to house_chore_path(@house_chore)
  end

  private

    def task_params
      params.require(:task).permit(:description, :house_chore_id)
    end
end
