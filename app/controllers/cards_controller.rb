class CardsController < ApplicationController
  def new
    @card = Card.new
  end
  
  def create

    @card = Card.create(new_card_params)
      add_tasks = JSON.parse(params[:add_tasks])
      add_tasks.each do |add_task|
        @task = Task.create(add_task.merge(card_id: @card.id))
      end
  end

    private
    def new_card_params
      params.require(:card).permit(:title, :explanation, :working_hours, :limit_date, :working_date).merge(user_id: current_user.id, owner_id: current_user.id)
    end
  
end
