class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @type = ["Fuel","Car Costs","Marketing","Franchise Costs","Other"]
      @expense = current_user.expenses.build
      @income = Income.new(params[:income])
      if params[:date].present?
      @start_date = params[:date].to_date.beginning_of_month
      @end_date = @start_date + 1.month
      @expenses = current_user.expenses.where(:date => (@start_date)..(@end_date))
      @incomes = current_user.incomes.where(:date => (@start_date)..(@end_date))
      else
      @expenses = current_user.expenses.all
      @incomes = current_user.incomes.all
      end
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @user = User.new
    end
  end

  def help
  end
  def summary_boxes
      if params[:date].present? && params[:date] != "all"
         @start_date = params[:date].to_date
         @end_date = @start_date + 1.month
         @incomes = current_user.incomes.where(:date => (@start_date)..(@end_date))
         @expenses = current_user.expenses.where(:date => (@start_date)..(@end_date))
         else
         @incomes = current_user.incomes.all
         @expenses = current_user.expenses.all
      end
      render :partial => 'shared/summary_boxes'
  end
end