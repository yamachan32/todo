class CardsController < ApplicationController
  def new
    @card = Card.new
  end
  
  def create
    @card = Card.create(new_card_params)
      add_tasks = JSON.parse(params[:add_tasks])
      add_tasks.each do |add_task|
        @task = Task.create(finish: add_task["finish"], matter:add_task["matter"], card_id: @card.id)
      end
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  def update
     @card = Card.update(new_card_params)
      add_tasks = JSON.parse(params[:add_tasks])
      add_tasks.each do |add_task|
        @task = Task.create(finish: add_task["finish"], matter:add_task["matter"], card_id: @card.id)
      end
  end
    private
    def new_card_params
      params.require(:card).permit(:title, :explanation, :working_hours, :limit_date, :working_date).merge(user_id: current_user.id, owner_id: current_user.id)
    end

    def new_task_params
      params.require(:task).permit(:finish, :matter).merge(card_id: @card_id)
    end
  
end
