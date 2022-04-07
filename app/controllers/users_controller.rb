class UsersController < ApplicationController

  # ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
  def index

  end

  def show
    card_sort
    binding.pry
  end

  private

  def card_sort
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日


    @team = Team.find(params[:id])
    user_ids = TeamUser.where(team_id: params[:id]).pluck(:user_id)
    @members = User.where(id: user_ids)

    cards = Card.where(user_id: user_ids)

    # (date: @todays_date..@todays_date + 6)
    
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

