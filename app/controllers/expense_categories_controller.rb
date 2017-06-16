class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @expense_categories = ExpenseCategory.where(user: current_user)
  end

  def show
  end

  def new
    @expense_category = ExpenseCategory.new
  end

  def edit
  end

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    @expense_category.user_id = current_user.id

    if @expense_category.save
      redirect_to @expense_category, notice: 'Expense category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @expense_category.update(expense_category_params)
      redirect_to @expense_category, notice: 'Expense category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense_category.destroy
    redirect_to expense_categories_url, notice: 'Expense category was successfully destroyed.'
  end

  private

    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    def expense_category_params
      params.require(:expense_category).permit(:category_name, :description)
    end

    def check_user
      if @expense_category.user_id != current_user.id
        redirect_to root_url, alert: "Sorry, you are not authorized."
      end
    end

end
