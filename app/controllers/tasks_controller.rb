class TasksController < ApplicationController
  def new
    @task = Task.new
    @card = Card.find(params[:card_id])
  end
end
