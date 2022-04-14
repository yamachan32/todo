class UsersController < ApplicationController
  def index
  end

  def show
    card_sort
  end

  private

  def card_sort
    wdays = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']

    todays_date = Date.today

    user = User.find(params[:id])

    cards = Card.includes(:tasks).where(user_id: user.id)

    @user_cards = []

    week_days = []
    7.times do |x|
      today_cards = []

      cards.each do |card|
        if card[:user_id] == current_user.id && card[:limit_date] >= todays_date && (card.working_date == todays_date + x)
          # ここで振り分けてpushしよう
          today_cards.push(card)
        end
      end

      wday_num = Date.today.wday + x

      wday_num -= 7 if wday_num >= 7

      days = { month: (todays_date + x).month, date: (todays_date + x).day, wday: wdays[wday_num], cards: today_cards }
      week_days.push(days)
    end

    expired_cards = []
    unseted_cards = []

    cards.each do |card|
      if card[:user_id] == current_user.id
        expired_cards.push(card) if card[:limit_date] < todays_date
        unseted_cards.push(card) if card[:working_date].nil?
      end
    end

    @user_cards.push({ user: user, unseted: unseted_cards, expired: expired_cards, schedules: week_days })
  end
end
