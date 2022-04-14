class TeamsController < ApplicationController

  def index
    teamids = TeamUser.where(user_id: current_user.id).pluck(:team_id)
    @teams = Team.where(id: teamids)
    @user = User.find(current_user.id)
  end

  def new
    @team = Team.new

  end

  def create
    @team = Team.create(team_params)
    team_user = {user_id: current_user.id ,team_id: @team.id}
    TeamUser.create(team_user)
    redirect_to root_path
    
  end

  def show
    card_sort
  end

  def team_entry
    @member = TeamUser.new
  end


  def member_add
    @member = TeamUser.new(team_user_params)
    @member.save
    redirect_to team_path(params[:team_id])
  end

  # def edit
  # end

  # def destroy
  # end

  private

  def team_params
    params.require(:team).permit(:team_name, :team_explanation, :image).merge(user_id: current_user.id)
  end

  def team_user_params
    {user_id: params[:user_id] ,team_id: params[:team_id]}
  end

  def card_sort
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
    todays_date = Date.today
    @team = Team.find(params[:id])
    user_ids = TeamUser.where(team_id: params[:id]).pluck(:user_id)
    @members = User.where(id: user_ids)
    cards = Card.where(user_id: user_ids)
    
    @members_cards = []
    @members.each do |member|
      week_days = []
      7.times do |x|
        today_cards = []
        
        cards.each do |card|
          if card[:user_id] == member[:id] && card[:limit_date] >= todays_date
            # ここで振り分けてpushしよう
            today_cards.push(card) if card.working_date == todays_date + x
          end
        end

        wday_num = Date.today.wday + x
        
        if wday_num >= 7
          wday_num = wday_num -7
        end
        
        days = { month: (todays_date + x).month, date: (todays_date+x).day, wday: wdays[wday_num], cards: today_cards}
        week_days.push(days)
      end
 
      expired_cards = []
      unseted_cards = []

      cards.each do |card|
        if card[:user_id] == member[:id]
          expired_cards.push(card) if card[:limit_date] < todays_date
          unseted_cards.push(card) if card[:working_date] == nil
        end
      end

      @members_cards.push({member: member, unseted: unseted_cards, expired: expired_cards, schedules: week_days})
    end
  end
end
