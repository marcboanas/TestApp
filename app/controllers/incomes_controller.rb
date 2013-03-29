class IncomesController < ApplicationController
    
    def create
        @income = Income.new(params[:income])
        if @income.save
            @incomes = current_user.incomes.all
            respond_to do |format|
                format.html { redirect_to root_url }
                format.js { render }
                end
            else
            render 'static_pages/home'
        end
    end
    
    def destroy
        @income = Income.find(params[:id]).destroy
        flash[:success] = "Income Removed."
        redirect_to root_url
    end
    
    def destroy_multiple
        Income.destroy(params[:incomes])
        @incomes = current_user.incomes.all
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js { render }
            format.json { head :no_content }
        end
    end
    
    def new
       @income = Income.new(params[:income])
    end
    
    respond_to :html, :json
    def update
        @income = Income.find(params[:id])
        @income.update_attributes(params[:income])
        respond_with @income
    end
end