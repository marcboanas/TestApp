class IncomesController < ApplicationController
    
    def create
        @income = Income.new(params[:income])
        if @income.save
            if params[:date].present?
                @start_date = params[:date].to_date
                @end_date = @start_date + 1.month
                @incomes = current_user.incomes.where(:date => (@start_date)..(@end_date))
                else
                @incomes = current_user.incomes.all
            end
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
        if params[:date].present?
        @start_date = params[:date].to_date
        @end_date = @start_date + 1.month
        @incomes = current_user.incomes.where(:date => (@start_date)..(@end_date))
        else
        @incomes = current_user.incomes.all
        end
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
    
    def update
        @income = Income.find params[:id]
        
        respond_to do |format|
            if @income.update_attributes(params[:income])
                format.html { redirect_to(@income, :notice => 'Successfully updated.') }
                format.json { respond_with_bip(@income) }
                else
                format.html { render :action => "edit" }
                format.json { respond_with_bip(@income) }
            end
        end
    end
    
    def income_table
        if params[:date].present? && params[:date] != "all"
        @start_date = params[:date].to_date
        @end_date = @start_date + 1.month
        @incomes = current_user.incomes.where(:date => (@start_date)..(@end_date))
        else
        @incomes = current_user.incomes.all
        end
        render :partial => 'shared/income_list'
    end
    
    def income_form
        @income = Income.new(params[:income])
        render :partial => 'shared/income_form'
    end
end