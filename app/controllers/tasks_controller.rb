class TasksController < ApplicationController
  protect_from_forgery
  def new
    @task = Task.new
    @card = Card.find(params[:card_id])
  end

  def update

    task = Task.find(params[:task_id])

    task.finish = params[:finish]
    task.save
  end
end
