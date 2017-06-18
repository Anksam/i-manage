class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    if params[:expense_category].blank?
     @expenses = Expense.where(user: current_user).order("date DESC")
    else
     @category_id = ExpenseCategory.find_by(user: current_user, category_name: params[:expense_category]).id
     @expenses = Expense.where(user: current_user, category_id: @category_id).order("date DESC")
    end
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id

    if @expense.save
      redirect_to expenses_path, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: 'Expense was successfully destroyed.'
  end

  private

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:amount, :category_id, :date)
    end

    def check_user
      if @expense.user_id != current_user.id
        redirect_to root_url, alert: "Sorry, you are not authorized."
      end
    end

end
