class ExpensesController < ApplicationController
    
    def create
        @expense = current_user.expenses.build(params[:expense])
        if @expense.save
            @type = ["Fuel","Car Costs","Marketing","Franchise Costs","Other"]
            if params[:date].present?
            @start_date = params[:date].to_date
            @end_date = @start_date + 1.month
            @expenses = current_user.expenses.where(:date => (@start_date)..(@end_date))
            else
            @expenses = current_user.expenses.all
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
        @expense = Expense.find(params[:id]).destroy
        flash[:success] = "Expense Removed."
        redirect_to root_url
    end
    
    def destroy_multiple
        Expense.destroy(params[:expenses])
        @type = ["Fuel","Car Costs","Marketing","Franchise Costs","Other"]
        if params[:date].present?
        @start_date = params[:date].to_date
        @end_date = @start_date + 1.month
        @expenses = current_user.expenses.where(:date => (@start_date)..(@end_date))
        else
        @expenses = current_user.expenses.all
        end
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js { render }
            format.json { head :no_content }
        end
    end
    
    def new
        @expense = Expense.new(params[:expense])
    end
    
    respond_to :html, :json
    def update
        @expense = Expense.find(params[:id])
        @expense.update_attributes(params[:expense])
        respond_with @expense
    end
    
    def update
        @expense = Expense.find params[:id]
        
        respond_to do |format|
            if @expense.update_attributes(params[:expense])
                format.html { redirect_to(@expense, :notice => 'Successfully updated.') }
                format.json { respond_with_bip(@expense) }
                else
                format.html { render :action => "edit" }
                format.json { respond_with_bip(@expense) }
            end
        end
    end
    
    def expense_table
        @type = ["Fuel","Car Costs","Marketing","Franchise Costs","Other"]
        if params[:date].present? && params[:date] != "all"
        @start_date = params[:date].to_date
        @end_date = @start_date + 1.month
        @expenses = current_user.expenses.where(:date => (@start_date)..(@end_date))
        else
        @expenses = current_user.expenses.all
        end
        render :partial => 'shared/expense_list'
    end

    def expense_form
        @type = ["Fuel","Car Costs","Marketing","Franchise Costs","Other"]
        @expense = Expense.new(params[:expense])
        render :partial => 'shared/expense_form'
    end
end