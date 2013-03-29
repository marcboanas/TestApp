class ExpensesController < ApplicationController
    
    def create
        @expense = current_user.expenses.build(params[:expense])
        if @expense.save
            @expenses = current_user.expenses.all
            @type = ["Fuel","Car Costs","Marketing","Franchise Costs"]
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
        @expenses = current_user.expenses.all
        @type = ["Fuel","Car Costs","Marketing","Franchise Costs"]
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js { render }
            format.json { head :no_content }
        end
    end
    
    def new
       @expense = current_user.expenses.build(params[:expense])
    end
    
    respond_to :html, :json
    def update
        @expense = Expense.find(params[:id])
        @expense.update_attributes(params[:expense])
        respond_with @expense
    end
end