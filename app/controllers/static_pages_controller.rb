class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @type = ["Fuel","Car Costs","Marketing","Franchise Costs"]
      @expense = current_user.expenses.build
      @expenses = current_user.expenses.all
      @income = Income.new(params[:income])
      @incomes = current_user.incomes.all
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @user = User.new
    end
  end

  def help
  end
end
